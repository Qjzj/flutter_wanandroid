import 'package:flutter/material.dart';
import 'package:flutter_learn/routes/application.dart';
import 'package:provide/provide.dart';
import '../../Provider/user_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body:  Container(
        child: Center(child: RaisedButton(
          onPressed: () {
            Provide.value<UserProvider>(context).setLoginState(true);
            Application.router.navigateTo(context, '/');
          },
          child: Text('登录'),
        ),)
      ),
    );
  }
}