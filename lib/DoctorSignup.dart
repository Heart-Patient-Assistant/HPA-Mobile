import 'package:flutter/material.dart';
import 'package:flutter_appl/Done.dart';
import 'package:flutter_appl/databasehelpler.dart';


class DoctorSignup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DoctorSignupState();
  }
}

class _DoctorSignupState extends State<DoctorSignup>{
  DatabaseHelper databaseHelper = new DatabaseHelper();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();
  String type ='DOCTOR';
  Future<Register> _futureRegister;

  _signUp() {
    if (firstName.text.trim().isEmpty || email.text.trim().isEmpty
        ||lastName.text.trim().isEmpty || password.text.trim().isEmpty||repeatPassword.text.trim().isEmpty) {
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
    }
    else {
      setState(() {
        _futureRegister = databaseHelper.registerDoctorData(
            email.text.trim().toLowerCase(),
            firstName.text.trim(),
            lastName.text.trim(),
            password.text.trim(),
            repeatPassword.text.trim(),
            type.trim());
      });
      if (type.contains('DOCTOR') ){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Done()),
          ModalRoute.withName('/Done'),
        ); }     }
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign up'),
        backgroundColor: Colors.blueGrey,
      ),
      body: (_futureRegister == null)
          ? new Container(margin: EdgeInsets.only(left: 33.5, right: 33.5),
         child : ListView(
            padding: const EdgeInsets.only(
                top: 32),
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
              new Padding(padding: new EdgeInsets.only(top: 10.0),),

              Container(
                height: 50,
                child: new TextField(
                  controller: lastName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Last name',
                    icon: new Icon(Icons.person ),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 10.0),),

              Container(
                height: 50,
                child: new TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 10.0),),

              Container(
                height: 50,
                child: new TextField(obscureText: true,
                  controller: password,
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

              new Padding(padding: new EdgeInsets.only(top: 30.0),),

              new Container(
                alignment : Alignment.center,
                  padding: new EdgeInsets.only(left: 25),
                child : new RaisedButton(
                  onPressed: _signUp,
                  color: Colors.teal.shade700,
                  child: new Text(
                    'Sign up',
                    style: new TextStyle(
                      color: Colors.white,),
                  ),
                ),
              )
            ],
          ),
      ): FutureBuilder<Register>(
        future: _futureRegister,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.email);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return new Center(
            child: CircularProgressIndicator(),
          );
        },
      ),


    );
  }

}
