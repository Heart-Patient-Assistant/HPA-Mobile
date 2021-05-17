import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';


class PredictionModel extends StatefulWidget {
  @override
  _PredictionModelState createState() => _PredictionModelState();
}

class _PredictionModelState extends State<PredictionModel> {

  var status ;

   TextEditingController age = TextEditingController();
   TextEditingController sex = TextEditingController();
   TextEditingController cp = TextEditingController();
   TextEditingController trestbps = TextEditingController();
   TextEditingController chol = TextEditingController();
   TextEditingController fbs = TextEditingController();
   TextEditingController restecg = TextEditingController();
   TextEditingController thalach = TextEditingController();
   TextEditingController exang = TextEditingController();
   TextEditingController oldpeak = TextEditingController();
   TextEditingController slope = TextEditingController();
   TextEditingController ca = TextEditingController();
   TextEditingController thal = TextEditingController();


 Future Predict( ) async {

   int varAge =int.parse(age.text);
   int varSex =int.parse(sex.text);
   int varCp =int.parse(cp.text);
   int varTrestbps =int.parse(trestbps.text);
   int varChol =int.parse(chol.text);
   int varFbs =int.parse(fbs.text);
   int varRestecg =int.parse(restecg.text);
   int varThalach =int.parse(thalach.text);
   int varExang =int.parse(exang.text);
   int varOldpeak =int.parse(oldpeak.text);
   int varSlope =int.parse(slope.text);
   int varCa =int.parse(ca.text);
   int varThal =int.parse(thal.text);



   final response = await http.post(Uri.parse(
       "https://mahdy.pythonanywhere.com//services/getpredictionapi/"),
       body: {
         'age': "$varAge",
         'sex': "$varSex",
         'cp': "$varCp",
         'trestbps': "$varTrestbps",
         'chol': "$varChol",
         'fbs': "$varFbs",
         'restecg': "$varRestecg",
         'thalach': "$varThalach",
         'exang': "$varExang",
         'oldpeak': "$varOldpeak",
         'slope': "$varSlope",
         'ca': "$varCa",
         'thal': "$varThal"
       });
   status = response.body.contains('we got your back, we reccommed to contact one of our doctors');
   var data = json.decode(response.body);
   if(status){
     return showDialog(context: context, builder: (context){
       return AlertDialog(content: Text("${data['prediction']} ..... ${data['worry']}"),actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))],);
     });
   }else{
     return showDialog(context: context, builder: (context){
       return AlertDialog(content: Text("${data['prediction']} ..... ${data['worry']}"),actions: [FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))],);
     });
   }





 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Prediction",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: new Container(
          margin: EdgeInsets.only(left: 33.5, right: 33.5),
          child:
              ListView(
                padding: const EdgeInsets.only(top: 32),
                children: <Widget>[
                  Container(
                    height: 50,
                    child: new TextFormField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        icon: new Icon(Icons.circle),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    height: 50,
                    child: new TextFormField(
                      controller: sex,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Sex',
                        icon: new Icon(Icons.circle),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    height: 50,
                    child: new TextFormField(
                      controller: cp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'cp',
                        icon: new Icon(Icons.circle),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    height: 50,
                    child: new TextFormField(
                      controller: trestbps,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'trestbps',
                        icon: new Icon(Icons.circle),
                      ),
                    ),

                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    height: 50,
                    child: new TextFormField(
                      controller: chol,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'chol',
                        icon: Icon(Icons.circle)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: fbs,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'fbs',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: restecg,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'restecg',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: thalach,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'thalach',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: exang,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'exang',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: oldpeak,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'oldpeak',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: slope,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'slope',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: ca,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ca',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                  ),
                  Container(

                    height: 50,
                    child: new TextFormField(
                      controller: thal,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'thal',
                          icon: Icon(Icons.circle)
                      ),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(10.0)),

                  new ElevatedButton(onPressed: (){
                    Predict();
                  }, child: Text("Done"))
                ],
              ),

          ),
        );
  }
}
