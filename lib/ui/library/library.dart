import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'navigation.dart';
import 'viewpage.dart';

class Library extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LibraryState();
  }
}

class LibraryState extends State<Library> {

  int _index = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
      body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Stack(
            children: <Widget>[
              Container(
                child: Swiper.children(
                  //onIndexChanged: (_index){ print(_index); },
                  index: _index,
                  autoplay: false,
                  loop: false,
                  pagination:
                      PaginationTab(titles: ['Movies', 'Series',]),
                  children: <Widget>[
                    ViewPage(type: 0,),
                    ViewPage(type: 1,),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
