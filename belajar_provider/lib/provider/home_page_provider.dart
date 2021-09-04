import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{

  List<String> users = [];

  //method logic
  Future<void> getListUser() async{

    await Future.delayed(Duration(seconds: 5));

    users = ['Serr', 'asasa', 'asasa'];

    notifyListeners();

  }
}