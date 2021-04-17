import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  start() {
    setState(() {
      Navigator.of(context).pushReplacementNamed("/First");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Heart Patient Assistant",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal.shade700,
      ),
      body: new Container(
        child: new Column(
            children: [
          new Container(
            margin:EdgeInsets.only(right:25.0,top: 10.0),
            child: new Image.asset("img/heart.jpg"),
          ),
          new Text(
            "Welcome to",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30.0,
                fontFamily: "Banyu langits.ttf",
                // fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          new Padding(padding: EdgeInsets.all(5.0)),
          new Text(
            "HPA",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 40.0,
                fontFamily: "Banyu langits.ttf",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          new Padding(padding: EdgeInsets.all(45.0)),
          new RaisedButton.icon(
            onPressed: start,
            color: Colors.teal.shade600,
            label: Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
