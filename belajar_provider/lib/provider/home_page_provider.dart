import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageProvider extends ChangeNotifier{

  List users = [];
  bool loading = false;

  HomePageProvider(context){
    getListUser(context);
  }

  //method logic
  Future<void> getListUser(BuildContext context) async{
    loading = true;
    notifyListeners();

    http.Response res = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    loading = false;
    notifyListeners();

    if(res.statusCode == 200){

      var dataUser = jsonDecode(res.body);
      users = dataUser['data'];
      notifyListeners();

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
    }
  }

  // //method logic
  // Future<void> getListUser() async{
  //
  //   await Future.delayed(Duration(seconds: 5));
  //
  //   users = ['Serr', 'asasa', 'asasa'];
  //
  //   notifyListeners();
  //
  // }
}