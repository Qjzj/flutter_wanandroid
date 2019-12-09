import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool isLogin = false;
  /// 设置登录状态
  setLoginState(bool loginState) {
    isLogin = loginState;
    notifyListeners();
  }
}