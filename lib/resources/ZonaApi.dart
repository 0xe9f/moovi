import 'dart:io';
import 'package:dio/dio.dart';
import 'package:moovi/models/tileModel.dart';
import 'dart:convert';
import 'package:moovi/models/entities.dart';

class Movie {
  Map<String, dynamic> backdrops;
  List<Map<String, dynamic>> countries;
  List<Map<String, Map<String, dynamic>>> genres;

  Movie.convert(Map<String, dynamic> data) {
    data.forEach((key, value) {});
  }
}

class ZonaApi {
  Dio client = Dio();
  static String baseUrl = 'https://w32.zona.plus/';

  static Map<String, String> rHeaders = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0',
    'Accept': 'application/json, text/javascript, */*; q=0.01',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json; charset=utf-8',
  };
  Future fetchFullInfo(String altName, int type) async {
    String _type;
    Map<String, dynamic> rawData;
    dynamic usableData;
    if (type == 0)
      _type = 'movies';
    else if (type == 1) _type = 'tvseries';
    String url = '$baseUrl$_type/$altName';
    await client
        .get(url,
            options: Options(
                contentType: ContentType.json,
                responseType: ResponseType.json,
                headers: rHeaders))
        .then((r) {
      if (r.statusCode == 200) {
        rawData = r.data;
      } else {
        throw 'Error fetching';
      }
    });

    if (rawData.isNotEmpty) {
      if (type == 0) {
        return Converter().automate(rawData, 0);
      } else if (type == 1) {
        return Converter().automate(rawData, 1);
      } 
    }
  }

  Future<String> fetchVideoUrl(int id) async {
    String url = baseUrl + 'api/v1/video/' + id.toString();
    return await client
        .get(url,
            options: Options(
                contentType: ContentType.json,
                responseType: ResponseType.json,
                headers: rHeaders))
        .then((r) {
      if (r.statusCode == 200) return (r.data['url']);
    });
  }

  Future browserEpisodes(String nameId, season) async {
    String url = '$baseUrl/tvseries/$nameId/season-#season';
    client.get(url, options: Options(headers: rHeaders, contentType: ContentType.json, responseType: ResponseType.json)).then((r){
      if(r.statusCode == 200) return r.data['episodes'];
    });
  }

  Future<List<VideoM>> fetchItemsList(int type, int page) async {
    String _type_;
    List<dynamic> rawData = null;  
    if (page == 1)
      page++;
    else if (page >= 2) page++;
    if (type == 0)
      _type_ = 'movies';
    else
      _type_ = 'tvseries';

    String decodeBytes(String data) {
      return Utf8Codec().decode(Latin1Codec().encode(data));
    }
    print(_type_);
    Future x = await client
        .get('$baseUrl$_type_?page=$page',
            options: Options(
                contentType: ContentType.json,
                headers: rHeaders,
                responseType: ResponseType.json))
        .then((r) {
      if (r.statusCode == 200) {
        rawData = r.data['items'];
        }
      else {throw 'Error fetching items list';}
    });
    return VideoM.convert(rawData).readyData;
  }
}
