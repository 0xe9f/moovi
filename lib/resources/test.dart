/*import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moovi/resources/api.dart';
import 'package:moovi/ui/widgets/moovi_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';


class TestingPage extends StatefulWidget {
  TestingPage({Key key}) : super(key: key);

  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  static List<FData> usable_data = [];

  void loadData(int page) async {
    String raw_data;
    Response r = await http
        .get(
            'http://filmix.co/android.php?do=cat&category=&orderby=year&orderdir=desc&requested_url=filters/s0-g3-g75-g71&cstart=' +
                page.toString())
        .then((data) {
      raw_data = data.body;
      setState(){
        usable_data = FData.convert(raw_data).data;
      }
      print('data fetched and loaded in variables');
    }).whenComplete(() {
      print('fetching info complete!');
      setState(() {
        isLoadComplete = true;
        page = page++;
      });
    });
  }

  int _count = usable_data.length;
  int page = 0;
  bool isLoadComplete = false;

  Widget _listBuild(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _count,
        itemBuilder: (BuildContext context, int index) {
          //loadData(page);
          Tile(title: usable_data[index].title);
          //title: usable_data[0].title, img_url: usable_data[0].poster_url, year: usable_data[0].year,
        },
      ),
    );
  }

  /*Widget _future(BuildContext context, Widget list){
    return FutureBuilder(
      future: loadData(),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    //debugPrint(usable_data[0].title);
    if (isLoadComplete) {
      print('Complete');
      return Scaffold(body: _listBuild(context));
    } else {
      return Text('Loading...');
    }
  }
}*/
