import 'package:flutter/material.dart';
import 'package:flutter_appl/First.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login Page",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: new Column(
          children: [
            new Padding(padding: EdgeInsets.only(top: 40.0)),
            new Container(
                margin: EdgeInsets.only(top: 50.0),
                alignment: Alignment.center,
                child: new Text(
                  "Welcome !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 40.0,
                      fontStyle: FontStyle.italic),
                ))
          ],
        ));
  }
}
