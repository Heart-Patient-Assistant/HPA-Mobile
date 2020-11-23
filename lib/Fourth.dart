import 'package:flutter/material.dart';

class Fourth extends StatefulWidget {
  @override
  _FourthState createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  final TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  "Soon",
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
