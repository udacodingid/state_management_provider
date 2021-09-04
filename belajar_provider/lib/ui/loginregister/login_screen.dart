import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),

      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email'
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password'
              ),
            ),
            MaterialButton(onPressed: (){},
            child: Text("Login"),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
