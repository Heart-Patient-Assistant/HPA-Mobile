import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{

  String serverUrl = "http://127.0.0.1:8000/api";
  var status ;
  var token ;

  loginData(String username , String password) async{

    Uri myUrl = "$serverUrl/login1" as Uri;
    final response = await  http.post(myUrl,
        body: {
          "username": "$username",
          "password" : "$password"
        } ) ;
    status = response.body.contains('non_field_errors');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["non_field_errors"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  registerData(String firstName ,String lastName ,String email , String password, String password2 ,String type) async{

    Uri myUrl = "$serverUrl/register1" as Uri;
    final response = await  http.post(myUrl,
        body: {
          "email": "$email",
          "first_name": "$firstName",
          "last_name": "$lastName",
          "password" : "$password",
          "password2" : "$password2",
          "type" : "$type"
        } ) ;
    status = response.body.contains('non_field_errors');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["non_field_errors"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }


  void editData(int id,String firstName ,String lastName ,String email , String password, String password2) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    Uri myUrl = "$serverUrl$id" as Uri ;
    http.put(myUrl,
        body: {
          "email": "$email",
          "first_name": "$firstName",
          "last_name": "$lastName",
          "password" : "$password",
          "password2" : "$password2",
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    Uri myUrl = "$serverUrl/products/$id" as Uri;
    http.delete(myUrl).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


}