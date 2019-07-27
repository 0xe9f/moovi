



class Episode {
  int id;
  int pid;
  String key;
  String releaseDate;
  int season;
  String title;
  int episode;

  Episode({this.id, this.pid, this.key, this.releaseDate, this.season, this.title, this.episode});
}

class Episodes {
  int count;
  List<Episode> items = [];

  Episodes.from(Map<String, dynamic> data){
    Map<String, dynamic> subject = data['episodes'];
    count = subject['items'].length;
    for (var i = 1; i <= subject['items'].length; i++) {
      int _id = subject['items'][i.toString()]['id'];
      int _pid = subject['items'][i.toString()]['mobi_link_id'];
      String _key = subject['items'][i.toString()]['episode_key'];
      int _season = subject['items'][i.toString()]['season'];
      int _episode = subject['items'][i.toString()]['episode'];
      String _title = subject['items'][i.toString()]['title'];
      items.add(Episode(id: _id, pid: _pid, key: _key, season: _season, episode: _episode, title: _title));
    }
  }

  Episodes({this.count, this.items});
}

class Backdrop {
  int quality;
  String url;

  Backdrop({this.quality, this.url});
}

class Backdrops {
  List<Backdrop> items = [];

  Backdrops.from(Map<String, dynamic> data){
     data['backdrops'].forEach((k, v){
      items.add(Backdrop(quality: int.parse(k.replaceAll('image_', '')), url: v));
    });
  }

  Backdrops({this.items});
}

class Country {
  int id;
  String name;
  
  Country({this.id, this.name});
}

class Countries {
  List<Country> items = [];

  Countries.from(Map<String, dynamic> data){
    for (var i in data['countries']) {
      items.add(Country(id: i['id'], name: i['name']));
    }
  }
}

class Genre {
  bool adult;
  bool custom;
  bool fictional;
  int id;
  String name;
  int ord;
  String tName;
  Genre({this.adult, this.custom, this.fictional, this.id, this.name, this.ord, this.tName});
}

class Genres {
  List<Genre> items = [];
  Genres.from(Map<String, dynamic> data){
    for (var i in data['genres']) {
      items.add(Genre(adult: i['adult'], custom: i['custom'], fictional: i['fictional'], id: i['id'], name: i['name'], tName: i['translit'], ord: i['ord'], ));
    }
  }
  Genres({this.items});
}

class Person {
  int i;
  String name;
  String nameEng;
  String nameUkr;
  int o;
  int r;

  Person({this.i, this.name, this.nameEng, this.nameUkr, this.o, this.r});
}

class Actor extends Person{
  String coverUrl;
  Actor({this.coverUrl, i, name, nameEng, nameUkr, o, r}) : super(i: i, name: name, nameEng: nameEng, nameUkr: nameUkr, o: o, r: r);
}

class Persons {
  List<Actor> actors = [];
  List<Person> director = [];
  List<Person> producer = [];
  List<Person> scripter = [];

  Persons.from(Map<String, dynamic> data){
    Map<String, dynamic> subject = data['persons'];

    for (var i in subject['actors']) {
      actors.add(Actor(coverUrl: i['cover'], i: i['i'], name: i['name'], nameEng: i['name_eng'], nameUkr: i['name_ukr'], o: i['o'], r: i['r']));
    }
    for (var i in subject['director']) {
      director.add(Person(i: i['i'], name: i['name'], nameEng: i['name_eng'], nameUkr: i['name_ukr'], o: i['o'], r: i['r']));
    }
    for (var i in subject['producer']) {
      producer.add(Person(i: i['i'], name: i['name'], nameEng: i['name_eng'], nameUkr: i['name_ukr'], o: i['o'], r: i['r']));
    }
    for (var i in subject['scenarist']) {
      scripter.add(Person(i: i['i'], name: i['name'], nameEng: i['name_eng'], nameUkr: i['name_ukr'], o: i['o'], r: i['r']));
    }
  }

  Persons({this.actors, this.director, this.producer, this.scripter});
}

class Seasons {
  int count;
  int current;
  Seasons.from(Map<String, dynamic> data){
    Map<String, dynamic> subject = data['seasons'];
    count = subject['count'];
    current = subject['current'];
  }
  Seasons({this.count, this.current});
}

class Info {
  Country country;
  String description;
  String genreId;
  int id;
  int pid;
  String nameId;
  String name;
  String nameOrig;
  String imageUrl;
  int year;
  String date;

  Info.from(Map<String, dynamic> data, int type){
    String subjectType = 'movie';
    if(type == 0) subjectType = 'movie';
    else if(type == 1) subjectType = 'serial';
    Map<String, dynamic> subject = data[subjectType];
    country = Country(name: subject['country']);
    description = subject['description'];
    genreId = subject['genreId'];
    id = subject['id'];
    pid = subject['mobi_link_id'];
    nameId = subject['name_id'];
    name = subject['name_rus'];
    nameOrig = subject['name_original'];
    imageUrl = subject['image'];
    year = subject['year'];
    date = subject['release_date_rus'];
  }

  Info({this.country, this.year, this.description, this.genreId, this.id, this.name, this.nameId, this.pid, this.nameOrig, this.date});
}

class Entity {
  Countries countries;
  Genres genres;
  Info info;
  Persons persons;
  Backdrops backdrops;
  Entity({this.countries, this.genres, this.info, this.persons, this.backdrops});
}

class Serial extends Entity{
  Episodes episodes;
  Seasons seasons;
  
  Serial({countries, genres, info, persons, backdrops, this.episodes, this.seasons}) : super(countries: countries, genres: genres, info: info, persons: persons, backdrops: backdrops);
}

class Movie extends Entity{
  Episode episode;

  Movie({countries, genres, info, persons, backdrops, this.episode}) : super(countries: countries, genres: genres, info: info, persons: persons, backdrops: backdrops);
}

class Converter {
  automate(Map<String, dynamic> data, int type) async {
    if(type == 0){
      return Movie(countries: Countries.from(data), genres: Genres.from(data), info: Info.from(data, type), persons: Persons.from(data), backdrops: Backdrops.from(data));
    }
    else if(type == 1){
      return Serial(countries: Countries.from(data), genres: Genres.from(data), info: Info.from(data, type), persons: Persons.from(data), backdrops: Backdrops.from(data), episodes: Episodes.from(data), seasons: Seasons.from(data));
    }
  }
  }