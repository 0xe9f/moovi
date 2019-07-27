import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:moovi/ui/widgets/moovi_widgets.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:moovi/models/tileModel.dart';
import 'package:moovi/resources/ZonaApi.dart';
import './fullpage.dart';


class ViewPage extends StatefulWidget {
  final int type;
  
  ViewPage({Key key, this.type});

  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Widget _itemBuilder(context, VideoM entry, _) {
    return Tile(
        title: entry.title,
        imgUrl: entry.poster,
        rating: entry.rating,
        year: entry.year,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FullPage(entry.nameId, type: widget.type,)));
        });
  }

  @override
  Widget build(BuildContext context) {
    const int PAGE_SIZE = 60;
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: 60),
        child: PagewiseListView(
            addAutomaticKeepAlives: true,
            padding: const EdgeInsets.all(25),
            pageSize: PAGE_SIZE,
            itemBuilder: this._itemBuilder,
            pageFuture: (pageIndex) =>
                ZonaApi().fetchItemsList(widget.type, pageIndex)));
  }
}
