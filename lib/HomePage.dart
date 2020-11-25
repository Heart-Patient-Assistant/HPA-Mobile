import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,),),
          backgroundColor: Colors.blueGrey,),
        body: new Column(
          children: [
            new Padding(padding: EdgeInsets.only(top: 40.0)),
            new Container(
                margin: EdgeInsets.only(top: 50.0),
                alignment: Alignment.center,
                child: new Text("Welcome User!",textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey,fontSize: 40.0,fontStyle: FontStyle.italic),
                ))
          ],
        ));
  }
}