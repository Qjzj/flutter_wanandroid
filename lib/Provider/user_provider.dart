import 'package:flutter/material.dart';
import '../routes/application.dart';

class UserProvider extends ChangeNotifier {
  bool isLogin = false;
  String userName;
  String pwd;
  /// 设置登录状态
  setLoginState(bool loginState) {
    isLogin = loginState;
    notifyListeners();
  }

  saveUser(String _userName, String _pwd) {
    userName = _userName;
    pwd = _pwd;
    Application.spfs.setString('userName', _userName);
    Application.spfs.setString('pwd', pwd);
    notifyListeners();
  }
}