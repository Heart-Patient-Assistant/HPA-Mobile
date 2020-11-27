import 'package:flutter/material.dart';
import 'package:flutter_appl/Second.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  String name = '';
  void login() {
    setState(() {
      if (userName.text.trim().isEmpty && password.text.trim().isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Please enter your name and password"),
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
        Navigator.of(context).pushNamed("/Second", arguments: {
          'user': userName,
        });
      }
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

  int radioGroup = 0;

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
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
                controller: userName,
                decoration: InputDecoration(
                  icon: new Icon(Icons.person, color: Colors.blueGrey),
                  hintText: "Your Name",
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
                      hintText: "Password",
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Container(
                      margin: EdgeInsets.only(left: 90.0),
                      child: new Column(
                        children: [
                          new RadioListTile(
                            value: 0,
                            groupValue: radioGroup,
                            onChanged: radioEventHandler,
                            title: new Text("Doctor"),
                          ),
                          new RadioListTile(
                            value: 1,
                            groupValue: radioGroup,
                            onChanged: radioEventHandler,
                            title: new Text("Patient"),
                          ),
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
            new Padding(padding: EdgeInsets.zero),
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
