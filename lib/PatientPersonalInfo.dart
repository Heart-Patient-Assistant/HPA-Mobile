import 'package:flutter/material.dart';
import 'package:flutter_appl/Done.dart';


class PatientPersonalInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PatientPersonalInfoState();
  }
}

class _PatientPersonalInfoState extends State<PatientPersonalInfo>{
  final TextEditingController age = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController diagnosis = TextEditingController();
  final TextEditingController files = TextEditingController();

  void _signUp() {
    setState(() {
      if (age.text.trim().isEmpty || height.text.trim().isEmpty
          ||weight.text.trim().isEmpty || bloodType.text.trim().isEmpty
         ) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Please complete the required information "),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text(
                        "Ok",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              );
            });
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil('/Done', (Route<dynamic> route)=> false, arguments: {
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second : Personal Information'),
        backgroundColor: Colors.blueGrey,
      ),
      body:new Container(
        child: new ListView(
          children: [ new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children :[
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
               margin: EdgeInsets.only(left: 60, right: 20),
               child: new TextField(
                   controller: age,
                   textDirection: TextDirection.ltr,
                   keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Age",),
                ),),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
                margin: EdgeInsets.only(left: 60, right: 20),
                child: new TextField(
                     controller: height,
                     textDirection: TextDirection.ltr,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(hintText: "Height",),
                 ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
               margin: EdgeInsets.only(left: 60, right: 20),
               child: new TextField(
                    controller: weight,
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Weight",),
                ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Container(
              margin: EdgeInsets.only(left: 60, right: 20),
              child: new TextField(
              controller: bloodType,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Blood Type", ),
            ),
            ),
         new Padding(padding: EdgeInsets.all(5.0)),
         new Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: new TextField(
            controller: diagnosis,
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "If you know your diagnosis, please insert it",
              icon: new Icon(
                  Icons.assignment,
                  color: Colors.blueGrey),
            ),
          ),
        ),
            new Padding(padding: EdgeInsets.all(5.0)),
            new Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: new TextField(
                controller: files,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "If you have any reports, please upload it",
                  icon: new Icon(
                      Icons.file_upload,
                      color: Colors.blueGrey),
                ),
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new FlatButton(onPressed:_signUp,
              child: new Text('Sign up'),color: Colors.blueGrey,textColor: Colors.white,)
          ],),
        ],),
      ),
    );
  }

}
