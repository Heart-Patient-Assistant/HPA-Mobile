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
        title: new Text('First : Account Information'),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
        margin: EdgeInsets.all(5.0),
        alignment: Alignment.center,
        child: new ListView(
          children:[
          new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  new Padding(padding: EdgeInsets.all(15.0)),
            new Container(
              margin: EdgeInsets.only(left: 20, right: 20),
            child: new TextField(
              controller: name,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Name",
                icon: new Icon(
                    Icons.person,
                    color: Colors.blueGrey),
              ),
              ),
            ),
           new Padding(padding: EdgeInsets.all(5.0)),
            new Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: new TextField(
              controller: email,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "E-mail",
                icon: new Icon(
                    Icons.email,
                    color: Colors.blueGrey),),
            ),
            ),
           new Padding(padding: EdgeInsets.all(5.0)),
            new Container(
              margin: EdgeInsets.only(left: 20, right: 20),
               child: new TextField(
                    controller: userName,
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                    hintText: "User name",
                    icon: new Icon(
                      Icons.supervised_user_circle,
                      color: Colors.blueGrey),
                    ),
               ),
            ),
            new Padding(padding: EdgeInsets.all(5.0)),
            new Container(
                  margin: EdgeInsets.only(left: 60, right: 20),
                  child:new TextField(
                  controller: password,
                  obscureText: true,
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                        hintText: "Password",) ,
                  ),
            ),
            new Padding(padding: EdgeInsets.all(5.0)),
            new Container(
                 margin: EdgeInsets.only(left: 60, right: 20),
                 child:new TextField(
                    controller:repeatPassword ,
                    obscureText: true,
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.visiblePassword,
                   decoration: InputDecoration(hintText: "repeatPassword", ) ,
                ),
            ),
            new Padding(padding: EdgeInsets.all(5.0)),
            new FlatButton(
              onPressed:next,
              child: new Text('next'),
              color: Colors.blueGrey,
              textColor: Colors.white,
            )
          ],),
    ],),
    ),


    );

  }

}

