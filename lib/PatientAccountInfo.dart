import 'package:flutter/material.dart';
import 'package:flutter_appl/PatientPersonalInfo.dart';
import 'dart:async';

class PatientAccountInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PatientState();
  }
}

class _PatientState extends State<PatientAccountInfo>{
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();

  void next() {
    setState(() {
      if (name.text.trim().isEmpty || email.text.trim().isEmpty
          ||userName.text.trim().isEmpty || password.text.trim().isEmpty||repeatPassword.text.trim().isEmpty) {
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
      } else if(password.text.trim()!= repeatPassword.text.trim()){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Please convert the password "),
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
      }else {
        Navigator.of(context).pushNamed('/PatientPersonalInfo');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Account Information'),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(margin: EdgeInsets.only(left: 33.5, right: 33.5),
        child: ListView(
          padding: const EdgeInsets.only(
              top: 32),
          children: <Widget>[
            Container(
              height: 50,
              child: new TextField(
                controller: name,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Name',
                  icon: new Icon(Icons.person),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 10.0),),

            Container(
              height: 50,
              child: new TextField(
                controller: email,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  icon: new Icon(Icons.email),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 10.0),),

            Container(
              height: 50,
              child: new TextField(
                controller: userName,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'User name',
                  icon: new Icon(Icons.person ),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 10.0),),

            Container(
              height: 50,
              child: new TextField( obscureText: true,
                controller: password,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: new Icon(Icons.lock),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 10.0),),

            Container(margin: EdgeInsets.only(left:  40,),
              height: 50,
              child: new TextField(obscureText: true,
                controller: repeatPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Re-password',
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
                onPressed: next,
                color: Colors.teal.shade700,
                child: new Text(
                  'Next',
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],),
      ),

    );

  }

}

