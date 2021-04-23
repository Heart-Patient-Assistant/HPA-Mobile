import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_appl/EditDoctorProfile.dart';
import 'package:flutter_appl/First.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  PickedFile _imageFile2;
  final ImagePicker picker2 = ImagePicker();
  String _imagePath2;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              new Padding(padding: EdgeInsets.only(left: 100.0)),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery'))
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker2.getImage(
      source: source,
    );
    setState(() {
      _imageFile2 = pickedFile;
    });
  }

  void saveImage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagePath", path);
  }

  void loadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagePath2 = saveimage.getString("imagePath");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Doctor's Profile",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal.shade700,
          actions: [
            FlatButton.icon(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new EditDoctorProfile(),
                ));
              },
              icon: Icon(Icons.edit,
                  color: Colors.white),
              label: Text(''),
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Edit Your Personal Information"),
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
              },
            )
          ],
        ),
        body: new Column(
          children: [
            new Padding(padding: EdgeInsets.only(top: 40.0)),
            new Stack(
                alignment: Alignment.center,
                children: [
                  _imagePath2 != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(File(_imagePath2)),
                          radius: 70,
                        )
                      : CircleAvatar(
                          backgroundImage: _imageFile2 == null
                              ? AssetImage('img/doctorIcon2.jpg')
                              : FileImage(File(_imageFile2.path)),
                          backgroundColor: Colors.blueGrey,
                          radius: 70,
                          child: Container(
                            padding: EdgeInsets.only(top: 100.0, left: 90.0),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomSheet()));
                              },
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        )
                ]),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  "Doctor's Name",
                  style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            new Padding(padding: EdgeInsets.all(20.0)),
            new Card(
              child: new Column(
                children: [
                  new Text("Medical Degree:"),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(20.0)),
            new ElevatedButton(
              onPressed: () {
                saveImage(_imageFile2.path);
              },
              child: Text("Save Picture"),
            )
          ],
        ));
  }
}
