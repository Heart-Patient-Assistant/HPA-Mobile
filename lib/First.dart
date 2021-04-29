import 'package:flutter/material.dart';
import 'package:flutter_appl/DoctorProfile.dart';
import 'package:flutter_appl/HomePage.dart';
import 'package:flutter_appl/PatientProfile.dart';
import 'package:flutter_appl/databasehelpler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class First extends StatefulWidget {
  First({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    if (value != '0') {
      // if (radioGroup == 0) {
      //   Navigator.of(context).push(
      //       new MaterialPageRoute(
      //         builder: (BuildContext context) => new DoctorProfile(),
      //       )
      //   );
      // } else if (radioGroup == 1){
      //   Navigator.of(context).push(
      //       new MaterialPageRoute(
      //         builder: (BuildContext context) => new Second(),
      //       )
      //   );
      // }

    }
  }

  @override
  initState() {
    read();
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String name = '';
  int radioGroup = 2;

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
    });
  }


  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
    });
  }

  _signUp() {
    setState(() {
      Navigator.of(context).pushNamed('/Third');
    });
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
                controller: _emailController,
                decoration: InputDecoration(
                  icon: new Icon(Icons.person, color: Colors.blueGrey),
                  labelText: 'E-mail',
                ),
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.5)),
            new Container(
              margin: EdgeInsets.only(left: 33.5, right: 33.5),
              child: Column(
                children: [
                  new TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.blueGrey,
                      ),
                      labelText: 'Password',
                    ),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30.0)),
                  new Container(
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: radioGroup,
                            onChanged: radioEventHandler,
                          ),
                          new Text("Doctor"),
                          SizedBox(
                            width: 30,
                          ),
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
            new Padding(padding: EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  alignment: Alignment.center,
                  child: new RaisedButton(
                    onPressed: () {
                      if (_emailController.text.trim().isEmpty ||
                          _passwordController.text.trim().isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: new Text('Complete'),
                                content: Text(
                                    "Please input your e-mail and password"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: new Text(
                                        'Ok',
                                        style: TextStyle(color: Colors.blue),
                                      ))
                                ],
                              );
                            });
                      } else {
                        setState(() {
                          if (_emailController.text
                                  .trim()
                                  .toLowerCase()
                                  .isNotEmpty &&
                              _passwordController.text.trim().isNotEmpty) {
                            databaseHelper
                                .loginData(
                                    _emailController.text.trim().toLowerCase(),
                                    _passwordController.text.trim())
                                .whenComplete(() {
                              if (databaseHelper.status) {
                                _showDialog();
                                msgStatus = 'Check email or password';
                              }
                              if (radioGroup == 0) {
                                Navigator.of(context)
                                    .pushNamed("/DoctorProfile", arguments: {
                                  'user': _emailController,
                                });
                              } else if (radioGroup == 1) {
                                Navigator.of(context)
                                    .pushNamed("/PatientProfile", arguments: {
                                  'user': _emailController,
                                });
                              }
                            });
                          }
                        });
                      }
                    },
                    child: Text("Login"),
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                new Container(
                  child: new RaisedButton(
                    onPressed: _clear,
                    child: Text("Clear"),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 75.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("Don't have an account ?"),
                new FlatButton(
                    onPressed: _signUp,
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

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(
                    'Ok',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          );
        });
  }
}
