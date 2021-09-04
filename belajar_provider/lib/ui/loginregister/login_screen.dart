import 'package:belajar_provider/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),

        body: Consumer<AuthProvider>(
          builder: (BuildContext context,AuthProvider value, Widget child){
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20
              ),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: value.email,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email'
                      ),
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      controller: value.password,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password'
                      ),
                    ),
                    SizedBox(height: 16,),
                    value.loadingLogin ? CircularProgressIndicator() :
                    MaterialButton(onPressed: (){
                      if(value.loadingLogin) return;
                      value.login(context);
                    },
                      child: Text("Login"),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
