import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// Moovi Logotype

class MooviLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'M',
      style: TextStyle(
          fontFamily: 'Rubik',
          fontStyle: FontStyle.normal,
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontSize: 52,
          fontWeight: FontWeight.bold),
    );
  }
}

class MoovieTFieldPosition {
  static BorderRadius top() {
    return BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0));
  }

  static BorderRadius between() {
    return BorderRadius.all(Radius.circular(0.0));
  }

  static BorderRadius bottom() {
    return BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
        bottomLeft: Radius.circular(5.0),
        bottomRight: Radius.circular(5.0));
  }
}

/* Text Field */

class MooviTextField extends StatefulWidget {
  final Key key;
  final String hint;
  final TextEditingController controller;
  final BorderRadius position;
  final GestureTapCallback onTap;
  final bool obscureText;
  final bool div;

  MooviTextField(
      {this.key,
      this.hint,
      this.controller,
      this.position,
      this.onTap,
      this.obscureText,
      this.div});

  _MooviTextFieldState createState() => _MooviTextFieldState();
}

class _MooviTextFieldState extends State<MooviTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextField(
          controller: widget.controller,
          onTap: widget.onTap,
          obscureText: widget.obscureText ?? false,
          decoration: new InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0)),
                borderRadius: widget.position),
            hintText: widget.hint,
            hintStyle: TextStyle(
                color: Color.fromRGBO(160, 160, 160, 1.0), fontSize: 17),
            hasFloatingPlaceholder: true,
            fillColor: Color.fromRGBO(229, 229, 229, 1.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(229, 229, 229, 1.0), width: 0.0),
                borderRadius: widget.position),
          ),
        ),
        Divider(height: 0.3),
      ],
    );
  }
}

/* Buttons */

class MooviButton extends StatelessWidget {
  // button`s text
  final String text;

  // width of button
  final double width;

  // height of button
  final double height;

  // what happends when user press on button
  final VoidCallback onPressed;

  MooviButton({this.text, this.width, this.height, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: this.width ?? 280,
        height: this.height ?? 50,
        child: RaisedButton(
            onPressed: this.onPressed ?? () {},
            child: Text(
              this.text,
              style: TextStyle(fontSize: 17),
            ),
            textColor: Color.fromRGBO(160, 160, 160, 1.0),
            elevation: 0,
            highlightElevation: 0.2,
            color: Color.fromRGBO(52, 62, 70, 1.0),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            )));
  }
}

class MooviFlatButton extends StatelessWidget {
  // button`s text
  final String text;

  // width of button
  final double width;

  // height of button
  final double height;

  // what happends when user press on button
  final VoidCallback onPressed;

  MooviFlatButton({this.text, this.width, this.height, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: this.width ?? 280,
        height: this.height ?? 50,
        child: FlatButton(
          onPressed: this.onPressed ?? () {},
          child: Text(
            this.text,
            style: TextStyle(fontSize: 16),
          ),
          textColor: Color.fromRGBO(57, 62, 70, 1.0),
        ));
  }
}

/* Rating stars */

class StarsRating extends StatefulWidget {
  final double rating;

  final Key key;

  StarsRating({this.key, this.rating});
  _StarsRatingState createState() => _StarsRatingState();
}

class _StarsRatingState extends State<StarsRating> {
  @override
  Widget build(BuildContext context) {
    double rating = widget.rating ?? 0.0;
    return Container(
      child: SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (v) {
            setState(() {
              rating = v;
            });
          },
          starCount: 5,
          rating: rating,
          size: 24.0,
          color: Colors.yellow,
          borderColor: Colors.yellow,
          spacing: 2.0),
    );
  }
}

/* Card for video-content  */

class Tile extends StatelessWidget {
  // title
  final String title;

  // year
  final int year;

  // preview Image which will parsed
  final String imgUrl;

  // rate 
  final double rating;

  // genere ['Drama', 'Techno Thriller']
  final String genere;

  final String nameId;

  final GestureTapCallback onTap;

  final Key key;

  const Tile(
      {this.title,
      this.nameId,
      this.year,
      this.imgUrl,
      this.rating,
      this.genere,
      this.onTap,
      this.key});

  @override
  Widget build(BuildContext context) {
    String _title = this.title ?? 'Title';
    int _year = this.year ?? 2018;
    var _img = this.imgUrl == null ? CircularProgressIndicator() : Image.network(
      this.imgUrl,
      height: 140.0,
      width: 90.0,
      fit: BoxFit.fill,
    );


    double _rate = this.rating ?? 0.0;
    String _genere = this.genere ?? 'Drama, Techno Thriller';

    // preview for movie
    final Widget picture = Container(
      child: new ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: _img,
      ),
    );

    // movies title
    final Widget title = Container(
      child: Text(
        _title,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );

    // movies year
    final Widget year = Container(
      child: Text(
        _year.toString(),
        style: TextStyle(color: Colors.white24, fontWeight: FontWeight.w700),
      ),
    );

    // movies genere
    final Widget genere = Container(
      child: Text(_genere,
          style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w700)),
    );

    // movies stars
    final Widget stars = StarsRating(
      rating: _rate,
    );

    // title & year
    final Widget mainfo = Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Expanded(child: title),
            year
          ]),
    );

    final Widget addinfo = Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 10), child: genere),
            stars
          ]),
    );

    final Widget leftSection = Container(child: picture);
    final Widget rightSection = Expanded(
        child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 10), child: mainfo),
                  addinfo
                ])));

    final Widget card = Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[leftSection, rightSection],
      ),
    );

    return GestureDetector(
        onTap: this.onTap ??
            () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Now not working.'),
                action: SnackBarAction(label: 'NO', onPressed: () {}),
              ));
            },
        child: card);
  }
}
