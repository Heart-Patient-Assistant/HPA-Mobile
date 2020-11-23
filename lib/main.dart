import 'package:flutter/material.dart';
import 'package:flutter_appl/First.dart';
import 'package:flutter_appl/HomeScreen.dart';
import 'package:flutter_appl/Second.dart';
import 'package:flutter_appl/Third.dart';
import 'package:flutter_appl/Fourth.dart';
import 'package:flutter_appl/HomeScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        '/First': (BuildContext context) => new First(),
        '/Second': (BuildContext context) => new Second(),
        '/Third': (BuildContext context) => new Third(),
        '/Fourth': (BuildContext context) => new Fourth()
      },
      home: new HomeScreen(),
    );
  }
}
