import 'dart:convert';

import 'package:belajar_provider/ui/homepage/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthProvider extends ChangeNotifier{
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool loadingLogin = false;

  Future<void> login(BuildContext context) async{
    if(email.text.isEmpty || password.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email atau password harus isi"))
      );
    }

    loadingLogin = true;
    notifyListeners();

    http.Response res = await http.post(Uri.parse('https://reqres.in/api/login'),
      body: {
        "email": email.text,
        "password" : password.text
      },);

    loadingLogin = false;
    notifyListeners();

    if(res.statusCode == 200){
      Map data = jsonDecode(res.body);
      if(data['token'] != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return HomeScreen();
        }));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email atau password salah"))
      );
    }
  }
}