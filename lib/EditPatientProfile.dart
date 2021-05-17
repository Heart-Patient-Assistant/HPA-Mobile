import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_appl/First.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_appl/PatientProfile.dart';

import 'databasehelpler.dart';

class EditPatientProfile extends StatefulWidget {
  List list;
  int index;
  EditPatientProfile({this.index, this.list});

  @override
  _EditPatientProfileState createState() => _EditPatientProfileState();
}

class _EditPatientProfileState extends State<EditPatientProfile> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _userNameController ;
  TextEditingController _passwordController ;
  TextEditingController _repeatPasswordController ;
  TextEditingController _ageController;
  TextEditingController _heightController;
  TextEditingController _weightController ;
  TextEditingController _bloodTypeController ;
  TextEditingController _diagnosisController ;


  // void initState(){
  //   _nameController = TextEditingController((text: widget.list[widget.index]['name']));
  //   _emailController = TextEditingController((text: widget.list[widget.index]['email']));
  //  _userNameController = TextEditingController((text: widget.list[widget.index]['userName']));
  //  _passwordController = TextEditingController((text: widget.list[widget.index]['password']));
  //  _repeatPasswordController = TextEditingController((text: widget.list[widget.index]['repeatPassword']));
  //  _ageController = TextEditingController((text: widget.list[widget.index]['age']));
  //  _heightController = TextEditingController((text: widget.list[widget.index]['height']));
  //  _weightController = TextEditingController((text: widget.list[widget.index]['weight'])) ;
  //  _bloodTypeController = TextEditingController((text: widget.list[widget.index]['bloodType'])) ;
  //  _diagnosisController = TextEditingController((text: widget.list[widget.index]['diagnosis'])) ;}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit your information',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit your information'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(margin: EdgeInsets.only(left: 33.5, right: 33.5),
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 32),
              children: <Widget>[
                Container(
                  height: 50,
                  child: new TextField(
                    controller: _nameController,
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
                    controller: _emailController,
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
                    controller: _userNameController,
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
                    controller: _passwordController,
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
                    controller: _repeatPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Re-password',
                    ),
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container(margin: EdgeInsets.only(left:  40,),
                  height: 50,
                  child: new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                ),new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container( margin: EdgeInsets.only(left:  40, ),
                  height: 50,
                  child: new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height',
                    ),
                  ),
                ),new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container(margin: EdgeInsets.only(left: 40, ),
                  height: 50,
                  child: new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight',
                    ),
                  ),
                ),new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container(margin: EdgeInsets.only(left: 40,),
                  height: 50,
                  child: new TextField(
                    controller: _bloodTypeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Blood type',
                    ),
                  ),
                ),new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container(margin: EdgeInsets.only(left: 40,),
                  child: new TextField(
                    maxLines: 7,
                    controller: _diagnosisController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration( border: OutlineInputBorder(),
                      labelText: 'Diagnosis',

                    ),
                  ),
                ),

                new Padding(
                  padding: new EdgeInsets.only(top: 44.0),
                ),
                Container(
                  alignment: Alignment.center ,
                  height: 100,
                  width: 400,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new OutlineButton(
                        onPressed: () {
                          Navigator.of(context).pop(new MaterialPageRoute(
                            builder: (BuildContext context) => new Second(),
                          ));
                        },
                        child: new Text(
                          'Cancel',

                        ),

                      ),
                      new Container( padding: new EdgeInsets.only(left: 25),
                          child : new RaisedButton(
                            onPressed: null,
                            color: Colors.teal.shade700,
                            child: new Text(
                              'Update',
                              style: new TextStyle(
                                  color: Colors.white,),
                            ),
                          ),
                      )
                    ],
                  )
                ),
              ],
            )),
      ),
    );
  }
}
