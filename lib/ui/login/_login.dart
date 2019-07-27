import 'package:flutter/material.dart';
//import 'login.dart';
import 'package:moovi/main_page.dart';

TextEditingController _emailController = new TextEditingController();
TextEditingController _passController = new TextEditingController();

var emailController = _emailController;
var passController = _passController;

int login(login, pass, context) {
  var tlogin = 'c4xbit@gmail.com';
  var tpass = '123456';
  if ((login == tlogin) && (pass == tpass)) {
    print('True!');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cograluations!"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Text('You are great!'),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromRGBO(160, 160, 160, 1.0)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  if(Navigator.of(context).pop()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
                  }

                },
              )
            ],
          );
        });
    return 1;
  } else {
    print('Isnt true!');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: const Text('Incorrect login or password'),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromRGBO(160, 160, 160, 1.0)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });

    return 0;
  }
}