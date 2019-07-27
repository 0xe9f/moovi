import 'package:flutter/material.dart';
import 'package:moovi/ui/auth/auth.dart';
import 'package:moovi/ui/library/library.dart';

class App extends StatefulWidget {
  @override
  _AppStateMain createState() => _AppStateMain();
}

class _AppStateMain extends State<App> {
  bool t = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moovi",
      color: Color.fromRGBO(34, 40, 49, 1.0),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(34, 40, 49, 1.0),
        backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
        accentColor: Color.fromRGBO(196, 196, 196, 1.0),
        buttonColor: Color.fromRGBO(52, 62, 70, 1.0),
        cursorColor: Colors.black54,
        textSelectionHandleColor: Colors.grey,
        buttonTheme: ButtonThemeData(),
      ),
      home: t ? Library() : Auth(),
      //home: SafeArea(child: TestingPage()),
    );
  }
}
