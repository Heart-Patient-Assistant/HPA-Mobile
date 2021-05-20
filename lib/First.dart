import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appl/PatientProfile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {

  var status ;
  var token ="c82eb1a3796cd5b38b4b1d22df589303a6e41b73";

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  String name = '';
  int radioGroup = 0;

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
    });
  }


  void clear() {
    setState(() {
      userName.clear();
      password.clear();
    });
  }

  void signUp() {
    setState(() {
      Navigator.of(context).pushNamed('/Third');
    });
  }

  Future login( ) async {

    var user =userName.text;
    var pass =password.text;


    final response = await http.post(

        Uri.parse("https://mahdy.pythonanywhere.com/api/users/signin/"),

        body: {
          'username': "$user",
          'password': "$pass",
        }

    );

   // status = response.body.contains('user login');
   // var data = json.decode(response.body);
   /* if(status){
      return showDialog(context: context, builder: (context){
        return AlertDialog(content: Text("${data['prediction']} ..... ${data['worry']}"),actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))],);
      });
    }else{
      return showDialog(context: context, builder: (context){
        return AlertDialog(content: Text("${data['prediction']} ..... ${data['worry']}"),actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))],);
      });
    }*/
    status = response.body.contains('non_field_errors');

    var data = json.decode(response.body);

   /* if(status){
      print('data : ${data["non_field_errors"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }*/

    setState(() {
      if (userName.text.trim().isEmpty || password.text.trim().isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Please enter your name and password."),
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
      } else if (radioGroup==0) {
        Navigator.of(context).pushNamed("/DoctorProfile", arguments: {
          'user': userName,
        });
      }else{
        Navigator.of(context).pushNamed("/Tips", arguments: {
          'user': userName,
        });
      }
    });



  }


  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          children: [
            new Padding(padding: EdgeInsets.all(23.5)),
            new Image.asset(
              'img/userIcon.jpg',
              height: 220.0,
              width: 900.0,
            ),
            new Padding(padding: EdgeInsets.all(5.5)),
            new Container(
              margin: EdgeInsets.only(left: 33.5, right: 33.5),
              child: new TextField(
                controller: userName,
                decoration: InputDecoration(
                  icon: new Icon(Icons.person, color: Colors.blueGrey),
                  labelText: 'Name',
                ),
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.5)),
            new Container(
              margin: EdgeInsets.only(left: 33.5, right: 33.5),
              child: Column(
                children: [
                  new TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.blueGrey,
                      ),
                      labelText: 'Password'   ,
                    ),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30.0)),
                  new Container(
                      margin: EdgeInsets.only(left: 35.0),
                      child: new Row(
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: radioGroup,
                            onChanged: radioEventHandler,
                          ),
                          new Text("Doctor"),
                          new Padding(padding: EdgeInsets.only(right:15.0)),
                          new Radio(
                            value: 1,
                            groupValue: radioGroup,
                            onChanged: radioEventHandler,
                          ),
                          new Text("Patient"),
                        ],
                      ))
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(15.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  margin: EdgeInsets.only(right: 10.5),
                  child: new FlatButton(
                    onPressed: login,
                    child: Text("Login"),
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 10.5),
                  child: new FlatButton(
                    onPressed: clear,
                    child: Text("Clear"),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 25.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("Don't have an account ?"),
                new FlatButton(
                    onPressed: signUp,
                    child: new Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
