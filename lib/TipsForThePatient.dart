import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tips",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            Text("What can you do to lower the risk of any heart disease ?",style: TextStyle(fontSize: 20.0,fontStyle: FontStyle.normal),),

            new Container(
              child: Column(
                children: [
                  Text(" - Control your blood pressure.",textDirection:TextDirection.ltr,textAlign:TextAlign.start,style: TextStyle(),),
                  Text(" - Keep your cholesterol and triglyceride levels under control.",textDirection:TextDirection.ltr,textAlign:TextAlign.start,),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Stay at a healthy weight.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Eat a healthy food.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Get regular exercise.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Limit alcohol.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Don't smoke.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Manage stress.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Manage diabetes.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  Text(" - Make sure that you get enough sleep.",textDirection:TextDirection.ltr,textAlign:TextAlign.start),
                  new Padding(padding: EdgeInsets.all(7.0)),
                ],
              ),
            ),

            new Padding(padding: EdgeInsets.all(10.0)),

            FlatButton(onPressed: (){setState(() {
              Navigator.of(context).pushNamed('/PatientProfile');
            });}, child: Text("Skip",style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
