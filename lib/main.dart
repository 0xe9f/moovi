import 'package:flutter/material.dart';
import 'app.dart';

var _version = 1.0;
var _co = 'Moovi Test';

void main() {
  runApp(App());
  print(_co + ' version ' + _version.toString());
}
