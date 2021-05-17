import 'package:flutter/material.dart';
import 'package:flutter_appl/DoctorProfile.dart';
import 'package:flutter_appl/First.dart';
import 'package:flutter_appl/HomeScreen.dart';
import 'package:flutter_appl/PatientProfile.dart';
import 'package:flutter_appl/Third.dart';
import 'package:flutter_appl/Done.dart';
import 'package:flutter_appl/HomeScreen.dart';
import 'package:flutter_appl/PatientAccountInfo.dart';
import 'package:flutter_appl/PatientPersonalInfo.dart' ;
import 'package:flutter_appl/DoctorSignup.dart';
import 'package:flutter_appl/HomePage.dart';
import 'package:flutter_appl/PredictionModel.dart';
import 'package:flutter_appl/TipsForThePatient.dart';



void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        '/First': (BuildContext context) => new First(),
        '/PatientProfile': (BuildContext context) => new Second(),
        '/Third': (BuildContext context) => new Third(),
        '/PatientAccountInfo': (BuildContext context) => new PatientAccountInfo(),
        '/PatientPersonalInfo': (BuildContext context) => new PatientPersonalInfo(),
        '/DoctorSignup': (BuildContext context) => new DoctorSignup(),
        '/Done': (BuildContext context) => new Done(),
        '/HomePage': (BuildContext context) => new HomePage(),
        '/DoctorProfile': (BuildContext context) => new DoctorProfile(),
        '/Prediction': (BuildContext context) => new PredictionModel(),
        '/Tips': (BuildContext context) => new Tips(),










      },
      home: new HomeScreen(),
    );
  }
}
