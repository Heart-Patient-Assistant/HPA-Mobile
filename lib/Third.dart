import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
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
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Image.asset('img/doctors.jpg'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/DoctorSignup');
              },
              child: Text("Doctor", style: TextStyle(color: Colors.white),),
              color: Colors.blueGrey,
            ),
            new Padding(padding: EdgeInsets.all(20.0)),
            new Image.asset("img/patient.jpg"),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/PatientAccountInfo');
                },
                child: Text("Patient", style: TextStyle(color: Colors.white)),
                color: Colors.blueGrey)
          ],
        ),
      ),
    );
  }
}
