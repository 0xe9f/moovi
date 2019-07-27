import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:moovi/models/tileModel.dart';
import 'dart:convert';

String firstInstanceUrl = 'http://filmix.co/';
String secondInstanceUrl = 'https://w29.zona.plus/';

class Api {
  Dio http = Dio();
  Map<String, String> headers = {
    'User-Agent': 'Mozilla/5.0 (Linux; Android 7.0; PLUS Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36',
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    'Accept-Encoding': 'gzip',
    'Connection': 'keep-alive',
    'X-FX-Token': ''
  };
  int getTs() {
    return DateTime.now().millisecondsSinceEpoch;
  }


  /* Future<List<VideoM>> fetchDataX(int type, int page)  async {
    if (page == 1)
      page++;
    else if (page >= 2) page++;
    String params = 'movies?page={$page}';

    List<dynamic> rawData;

    await http.get(secondInstanceUrl+params, headers: {
      'x-requested-with': 'XMLHttpRequest',
    }).then((data){ rawData = data.body; });
    
    return VideoM.convert(rawData).readyData;

  }*/
  String decodeFilmixUrl(String encodedUrl) {
    List<String> a = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "7",
      "=",
      "B",
      "D",
      "H",
      "I",
      "J",
      "L",
      "M",
      "N",
      "U",
      "V",
      "Z",
      "c",
      "f",
      "i",
      "k",
      "n"
    ];
    List<String> b = [
      "d",
      "9",
      "b",
      "e",
      "R",
      "X",
      "T",
      "r",
      "Y",
      "G",
      "W",
      "s",
      "u",
      "Q",
      "y",
      "a",
      "w",
      "o",
      "g",
      "z",
      "v",
      "m",
      "l",
      "x"
    ];

    var out = '';
    for (int i = 0; i < encodedUrl.length; i++) {
      var s = encodedUrl[i];
      var idx = a.indexOf(s);
      if (idx != -1) {
        out += b[idx];
      } else {
        idx = b.indexOf(s);
        if (idx != -1) {
          out += a[idx];
        } else {
          out += s;
        }
      }
    }
    return String.fromCharCodes(base64.decode(out));
  }

  Future<String> fetchVideoUrl(int id, String quality) async {
    // TODO: 1. доделать функцию получения доп. данных.
    // TODO: 2. каким-то макаром доделать вывод жанра..
    // TODO: 3. сделать при нажатии появление страницы с фильмом/сериалом/мультиком
    // TODO: [не очень важно на данном этапе] сделать поиск..
    // TODO: [важно и необходимо, выполнять параллельно с другими задачами]
    // TODO: получение полной ссылки на видео-поток.
    // TODO: [после предыдущей задачи] реализовать видео-плеер и проигрывание видео-потока.
    // TODO: сделать страница профиля
    // TODO: реализовать авторизацию/регистрацию (изначально можно через сторонние сервисы (vk, google..))
    // TODO: реализовать выбор озвучки, качества видео
    // TODO:

    String params = 'android.php?newsid=${id}';
    String rawData;
    await http
        .get(firstInstanceUrl + params,
            options: Options(
                contentType: ContentType.json,
                responseType: ResponseType.plain,
                headers: headers))
        .then((r) {
      if (r.statusCode == 200)
        rawData = r.data;
      else
        throw 'error data fetching api.dart';
    }).catchError((err) => throw err);

    String decodedUrl = (decodeFilmixUrl(
        jsonDecode(rawData)['player_links']['movie'][0]['link']));
    
    return getFullUrl(decodedUrl, quality);
  }

  List<String> getVideoQualities(String link) {
    int a = link.indexOf('[');
    int b = link.indexOf(']');
    List<String> q = link.substring(a + 1, b).trim().split(',');
    List toRemove = [];
    q.forEach((f) {
      if (f.isEmpty) {
        toRemove.add(f);
      }
    });
    q.removeWhere((e) => toRemove.contains(e));
    return q;
  }
String getFullUrl(String link, String quality){
  List<String> qualities = getVideoQualities(link);
  print('[Qualities] ${qualities}');
  int a = link.indexOf('[');
  int b = link.lastIndexOf('.');
  if(qualities.contains(quality)){
    return link.replaceRange(a, b, quality);
  } else { return 'Невозможно установить данное качество';}
}


// android.php?newsid=..
  Future<List<FData>> loadData(int page, int type) async {
    String rawData;
    String params;

    if (page == 1)
      page++;
    else if (page >= 2) page++;
    switch (type) {
      case 0:
        params =
            'android.php?do=cat&category=&orderby=year&orderdir=desc&requested_url=filters/s0-g3-g75-g71&cstart=' +
                page.toString();
        break;
      case 1:
        params =
            'android.php?do=cat&category=&orderby=year&orderdir=desc&requested_url=filters/s7-g3-g75-g71&cstart=' +
                page.toString();
        break;
      case 2:
        params =
            'android.php?do=cat&category=&orderby=year&orderdir=desc&requested_url=filters/s14-g3-g75-g71&cstart=' +
                page.toString();
        break;
      default:
        params =
            'android.php?orderby=year&odrderdir=desc&cstart=' + page.toString();
    }
    await http
        .get(firstInstanceUrl + params, options: Options(headers: headers))
        .then((r) {
      if (r.statusCode == 200) {
        rawData = r.data;
      } else {
        throw 'Error loading data: ${r.statusCode}';
      }
    });
    return FData.convert(rawData).data;
  }
}
