import 'package:flutter/material.dart';
import 'package:flutter_appl/Done.dart';
import 'package:flutter_appl/databasehelpler.dart';

class DoctorSignUp extends StatefulWidget {
  DoctorSignUp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _DoctorSignUpState();
  }
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();
  final TextEditingController medicalDegree = TextEditingController();
  final TextEditingController type = TextEditingController();

  // void signUp() {
  //   setState(() {
  //
  //     else {
  //       Navigator.of(context).pushNamedAndRemoveUntil('/Done', (Route<dynamic> route)=> false, arguments: {
  //       });      }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Sign up'),
          backgroundColor: Colors.blueGrey,
        ),
        body: new Container(
          margin: EdgeInsets.only(left: 33.5, right: 33.5),
          child: ListView(
            padding: const EdgeInsets.only(top: 32),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: firstName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'First name',
                    icon: new Icon(Icons.person),
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
                  controller: lastName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'User name',
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  obscureText: true,
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: new Icon(Icons.lock),
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
                  obscureText: true,
                  controller: repeatPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
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
                  controller: medicalDegree,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Medical degree',
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 30.0),
              ),
              new Container(
                alignment: Alignment.center,
                padding: new EdgeInsets.only(left: 25),
                child: new RaisedButton(
                  onPressed: () {
                    if (firstName.text.trim().isEmpty ||
                        lastName.text.trim().isEmpty ||
                        email.text.trim().isEmpty ||
                        password.text.trim().isEmpty ||
                        repeatPassword.text.trim().isEmpty ||
                        medicalDegree.text.trim().isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(" Complete "),
                              content: Text(
                                  'Please input this required information'),
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
                    } else if (password.text.trim() !=
                        repeatPassword.text.trim()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Attention"),
                              content: Text('Please check the password'),
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
                      setState(() {
                        if (email.text.trim().toLowerCase().isNotEmpty &&
                            firstName.text.trim().isNotEmpty &&
                            lastName.text.trim().isNotEmpty &&
                            password.text.trim().isNotEmpty &&
                            repeatPassword.text.trim().isNotEmpty) {
                          databaseHelper
                              .registerData(
                            email.text.trim().toLowerCase(),
                            firstName.text.trim(),
                            lastName.text.trim(),
                            password.text.trim(),
                            repeatPassword.text.trim(),
                            type.text.trim(),
                          )
                              .whenComplete(() {
                            if (databaseHelper.status) {
                              _showDialog();
                              msgStatus = 'Check your information';
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, '/DoctorProfile');
                            }
                          });
                        }
                      });
                    }
                  },
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
        ));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your information'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Ok',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
