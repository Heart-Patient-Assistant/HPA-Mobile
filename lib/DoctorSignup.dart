import 'package:flutter/material.dart';
import 'package:flutter_appl/Done.dart';


class DoctorSignup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DoctorSignupState();
  }
}

class _DoctorSignupState extends State<DoctorSignup>{
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repeatPassword = TextEditingController();
  final TextEditingController medicalDegree = TextEditingController();

  void signUp() {
    setState(() {
      if (name.text.trim().isEmpty || email.text.trim().isEmpty
          ||userName.text.trim().isEmpty || password.text.trim().isEmpty
          || medicalDegree.text.trim().isEmpty) {
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
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil('/Done', (Route<dynamic> route)=> false, arguments: {
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign up'),
        backgroundColor: Colors.blueGrey,
      ),
      body:new Container( margin: EdgeInsets.only(left: 33.5, right: 33.5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(controller: name,textDirection: TextDirection.ltr,keyboardType: TextInputType.name,decoration: InputDecoration(labelText: 'Name') ,)
            ,new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(controller: email,textDirection: TextDirection.ltr,keyboardType: TextInputType.emailAddress,decoration: InputDecoration(labelText: 'E-mail',) ,)
            ,new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(controller: userName,textDirection: TextDirection.ltr,keyboardType: TextInputType.name,decoration: InputDecoration(labelText: 'User name',) ,)
            ,new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(controller: password,obscureText: true, textDirection: TextDirection.ltr,keyboardType: TextInputType.visiblePassword,decoration: InputDecoration(labelText: 'Password', ) ,)
            ,new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(controller: repeatPassword,obscureText: true, textDirection: TextDirection.ltr,keyboardType: TextInputType.visiblePassword,decoration: InputDecoration(labelText: 'Re-password', ) ,)
            ,new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(controller: medicalDegree,textDirection: TextDirection.ltr,keyboardType: TextInputType.name,decoration: InputDecoration(labelText: 'Medical degree', ) ,)
            ,new Padding(padding: EdgeInsets.all(10.0)),
            new FlatButton(onPressed:signUp,
              child: new Text('Sign up'),color: Colors.blueGrey,textColor: Colors.white,)
          ],
        ),),


    );
  }

}
