import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/routes/application.dart';
import 'package:provide/provide.dart';
import '../../Provider/user_provider.dart';
import '../../api/loginApi.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height < 750
            ? 750
            : MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'images/bg_city.jpg',
              )),
        ),
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(40, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 120),
                _getHead(),
                SizedBox(
                  height: 40,
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHead() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(80)),
      child: ClipOval(
        child: Image.asset('images/head_default.jpg'),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String userName;
  String pwd;
  bool _obscure = true;
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: '用户名',
                  hintStyle: TextStyle(color: Colors.white60),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  icon: Icon(Icons.person, color: Colors.white)),
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入用户名';
                }
                return null;
              },
              onSaved: (String text) {
                setState(() {
                  userName = text;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: '密码',
                  hintStyle: TextStyle(color: Colors.white60),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  icon: Icon(Icons.lock, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  )),
              obscureText: _obscure,
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入密码';
                }
                if (value.length < 6) {
                  return '密码最少6位,最多16位';
                }
                return null;
              },
              onSaved: (String text) {
                setState(() {
                  pwd = text;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _loading ? Container(margin: EdgeInsets.only(right: 10), child: Icon(Icons.graphic_eq), color: Colors.white,): Container(),
                      Text(
                        '登录',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: _login,
                ),
                RaisedButton(
                  child: Text(
                    '注册',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.amber,
                  onPressed: _register,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _login() {
    FormState form = _formKey.currentState;
    if (form.validate()) {
      // 保存信息
      form.save();
      setState(() {
        _loading = true;
      });
      login(userName, pwd).then((data) {
        setState((){
          _loading = false;
        });
        if(data['errorCode'] != 0) {
          Toast
        }
        print(data);
      }).catchError((err) {
        setState((){
          _loading = false;
        });
        print('请求出错$err');
      })  ;
    } else {
      print('校验失败');
    }
  }

  _register() {}
}
