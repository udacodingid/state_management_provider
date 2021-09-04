import 'package:belajar_provider/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//setstate di ganti dengan notifylisternet pada provider

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomePageProvider(),
      
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Users'),
        ),
        
        body: Consumer<HomePageProvider>(
          builder: (BuildContext context,value, Widget child){
           return ListView.builder(
              itemCount: value.users.length,
              itemBuilder: (context, index){
                return Text(value.users[index]);
              },
            );
          },
        )
      ),
    );
  }
}
