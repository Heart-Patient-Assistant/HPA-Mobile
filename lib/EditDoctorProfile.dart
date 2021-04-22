import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_appl/DoctorProfile.dart';
import 'package:flutter_appl/First.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'databasehelpler.dart';

class EditDoctorProfile extends StatefulWidget {
  List list;
  int index;
  EditDoctorProfile({this.index, this.list});

  @override
  _EditDoctorProfileState createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _userNameController ;
  TextEditingController _passwordController ;
  TextEditingController _repeatPasswordController ;

  // void initState(){
  //   _nameController = TextEditingController((text: widget.list[widget.index]['name']));
  //   _emailController = TextEditingController((text: widget.list[widget.index]['email']));
  //  _userNameController = TextEditingController((text: widget.list[widget.index]['userName']));
  //  _passwordController = TextEditingController((text: widget.list[widget.index]['password']));
  //  _repeatPasswordController = TextEditingController((text: widget.list[widget.index]['repeatPassword'])); }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit your information',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit your information'),
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
                      icon: new Icon(Icons.account_circle),
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
                      labelText: 'username',
                      icon: new Icon(Icons.account_circle ),
                    ),
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container(
                  height: 50,
                  child: new TextField(obscureText: true,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: new Icon(Icons.vpn_key_rounded),
                    ),
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 10.0),),

                Container(
                  height: 50,
                  child: new TextField(obscureText: true,
                    controller: _repeatPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 're-password',
                      icon: new Icon(Icons.vpn_key_rounded),
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
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new DoctorProfile(),
                      ));
                    },
                    color: Colors.blue,
                    child: new Text(
                      'Update',
                      style: new TextStyle(
                          color: Colors.white, backgroundColor: Colors.blue),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
