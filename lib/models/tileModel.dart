import 'dart:convert';

class VideoM {
  int id;
  int pid;
  int year;
  String title;
  String poster;
  String nameId;
  double rating;


  List<VideoM> readyData = [];

  VideoM.convert(List<dynamic> rawData){
    rawData.forEach((f){ 
      readyData.add(VideoM(id: f['id'], pid: f['mobi_link_id'], nameId: f['name_id'],
                     title: f['name_rus'],year: f['year'], rating: f['rating'].toDouble(), poster: f['cover']));
                  });
  }
   VideoM({this.id, this.pid, this.title, this.nameId, this.year, this.poster, this.rating});
}

class FData {
  int id;
  String title;
  String originalTitle;
  //String genre;
  double rating;
  String posterUrl;
  int year;
  String date;
  String quality;
  String altName;

  List<FData> data = [];

  FData.convert(String rawData) {
    List<dynamic> rawDataDecoded = jsonDecode(rawData);
    //print('[Convert] {raw_data_decoded = ${raw_data_decoded}}');

    rawDataDecoded.forEach((f) {
      data.add(FData(
          id: int.parse(f['id']),
          title: f['title'],
          originalTitle: f['original_title'],
          rating: double.parse(f['rating']),
          // TODO: Genre is not available in response
          //genre: null,
          posterUrl: f['poster'],
          altName: f['alt_name']));
    });
  }

  FData(
      {this.id,
      this.title,
      this.rating,
      this.posterUrl,
      this.year,
      this.date,
      this.quality,
      this.originalTitle,
      this.altName});
}

