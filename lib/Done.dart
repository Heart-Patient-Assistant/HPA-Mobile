import 'package:flutter/material.dart';

class Done extends StatefulWidget {
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  final TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Done",
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
                child: new Text("Registration finished ", textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey,fontSize: 40.0,fontStyle: FontStyle.italic),)),
            new Container(
              padding: EdgeInsetsDirectional.only(top: 100.0),width: 300,height: 300,
              child: new Image.asset('img/done3.png'),),
            new Padding(padding: EdgeInsets.only(top: 180.0)),
            new Row(mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 new RaisedButton.icon(
                   onPressed:(){Navigator.of(context).pushNamedAndRemoveUntil('/HomePage', (Route<dynamic> route)=> false);},color: Colors.blueGrey,label: Text("Home",style: TextStyle(color: Colors.white),),
                   icon: Icon(Icons.arrow_forward,color: Colors.white,),),
               ],
           )

                       ],
        ));
  }
}