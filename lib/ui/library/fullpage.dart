import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moovi/resources/ZonaApi.dart';
import 'package:cplayer/cplayer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:snaplist/snaplist.dart';


class FullPage extends StatefulWidget {
  String nameId;
  int type;

  FullPage(this.nameId, {this.type});

  FullPageState createState() => FullPageState();
}

class FullPageState extends State<FullPage> {
  TextStyle titleStyle =
      TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800);
  TextStyle yearStyle = TextStyle(
      color: Colors.white54, fontSize: 20, fontWeight: FontWeight.w700);
  TextStyle descStyle = TextStyle(color: Colors.white, fontSize: 18);
  Widget header(String title, int year) {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: titleStyle,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(year.toString(), style: yearStyle))
          ],
        ));
  }

  Widget preview(String url) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Center(
        child: Container(
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Image.network(
              url,
              height: 200.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget description(String text) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
      child: Text(
        text,
        style: descStyle,
        maxLines: 8,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget videoTile(String title, int ep, {int pid, date}) {
    TextStyle _titleStyle = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
    TextStyle epStyle = TextStyle(color: Colors.white54, fontSize: 14);
    TextStyle dateStyle = TextStyle(
        color: Colors.white60, fontSize: 15, fontWeight: FontWeight.w500);
    Widget _preview = ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/preview.png',
        height: 70.0,
        width: 70.0,
        fit: BoxFit.cover,
      ),
    );

    Widget _title = Expanded(
        child: Text(
      title,
      maxLines: 2,
      style: _titleStyle,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
    ));
    Widget episode = Text(
      ep == null ? 'movie' : '$ep episode',
      style: epStyle,
      textAlign: TextAlign.right,
    );
    Widget minfo = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[_title, episode]);
    Widget realesedate = Text(
      date ?? '25 June 2015',
      style: dateStyle,
    );
    Widget header = Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
          child: Column(
            verticalDirection: VerticalDirection.down,
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 5), child: minfo),
              realesedate
            ],
          )),
    );

    return GestureDetector(
      child: Container(
          padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
          child: Row(
           // mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_preview, header],
          )),
      onTap: () async {
        await ZonaApi().fetchVideoUrl(pid).then((r) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CPlayer(
                        mimeType: 'video/mp4',
                        url: r,
                        title: title,
                      )));
        });
      },
    );
  }

  /* Widget videosList(var data) {
    if (widget.type == 1) {
      int PAGE_SIZE = data.episodes.count;
      print('[PG SIZE] $PAGE_SIZE');
      return PagewiseListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        itemBuilder: this._itemBuilder,
        pageFuture: (int index) => data.episodes.items[index],
        pageSize: PAGE_SIZE,
      );
    } else if (widget.type == 0) {
      return videoTile(data.info.name, 1, imgUrl: data.info.imageUrl, date: data.info.date);
    }
  }*/
  Widget episodesList(dynamic _data) {
    int index = 0;
    

    return Expanded(child: 
    SnapList(
      axis: Axis.vertical,
      sizeProvider: (index, data) => Size(450,110),
    separatorProvider: (index, data) => Size(0, 0),
    builder: (BuildContext context, int i, data){
            if (widget.type != 1) {
          return videoTile(_data.info.name, null,
              date: _data.info.date, pid: _data.info.pid);
        } else {
          return videoTile(
              _data.episodes.items[i].title, _data.episodes.items[i].episode,
              pid: _data.episodes.items[i].pid);
        }
    },
    count: widget.type == 1 ? _data.episodes.count : 1 ,),);
        /*ListView.builder(
      shrinkWrap: true,
      itemCount: widget.type != 1 ? 1 : data.episodes.count,
      itemBuilder: (BuildContext context, int i) {
        if (widget.type != 1) {
          return videoTile(data.info.name, null,
              date: data.info.date, pid: data.info.pid);
        } else {
          return videoTile(
              data.episodes.items[i].title, data.episodes.items[i].episode,
              pid: data.episodes.items[i].pid);
        }
      },
    )*/
  }

  Widget structure() {
    ScrollController c = ScrollController();
    return FutureBuilder(
      future: ZonaApi().fetchFullInfo(widget.nameId, widget.type),
      builder: (BuildContext context, AsyncSnapshot snap) {
        switch (snap.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            var _data = snap?.data;
            // print('[t] ${_data.episodes.items[0].title}');
            //print(data.backdrops.items[3].url);
            return Column(children: <Widget>[
              header(_data.info.name, _data.info.year),
              preview(_data.backdrops.items[0].url),
              description(_data.info.description),
              episodesList(_data)
            ]);
/**/
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
      body: SafeArea(
        child: structure(),
      ),
    );
  }
}
