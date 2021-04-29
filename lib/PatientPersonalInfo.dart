import 'package:flutter/material.dart';
import 'package:flutter_appl/Done.dart';

class PatientPersonalInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatientPersonalInfoState();
  }
}

class _PatientPersonalInfoState extends State<PatientPersonalInfo> {
  final TextEditingController age = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController diagnosis = TextEditingController();
  final TextEditingController files = TextEditingController();

  void _signUp() {
    setState(() {
      if (age.text.trim().isEmpty ||
          height.text.trim().isEmpty ||
          weight.text.trim().isEmpty ||
          bloodType.text.trim().isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content:Text("Please input the required information ") ,
                title: Text(" Complete "),
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
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/Done', (Route<dynamic> route) => false,
            arguments: {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Personal Information'),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 20, right: 33.5),
        child: new ListView(
          padding: const EdgeInsets.only(top: 32),
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 40,
              ),
              height: 50,
              child: new TextField(
                controller: age,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
              ),
              height: 50,
              child: new TextField(
                controller: height,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height',
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
              ),
              height: 50,
              child: new TextField(
                controller: weight,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
              ),
              height: 50,
              child: new TextField(
                controller: bloodType,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Blood type',
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
            ),
            Container(
              height: 50,
              child: new TextField(
                maxLines: 10,
                controller: files,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "If you have any reports, please upload it",
                  icon: new Icon(Icons.file_upload, color: Colors.blueGrey),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
            ),
            Container(
              child: new TextField(
                maxLines: 7,
                controller: diagnosis,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "If you know your diagnosis,please insert it",
                  icon: new Icon(Icons.assignment, color: Colors.blueGrey),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),
            new Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.only(left: 25),
              child: new RaisedButton(
                onPressed: _signUp,
                color: Colors.teal.shade700,
                child: new Text(
                  'Sign up',
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
