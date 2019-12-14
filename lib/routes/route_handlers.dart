import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/Setting/setting.dart';
import 'package:flutter_learn/pages/WebView/WebViewPage.dart';
import 'package:flutter_learn/routes/application.dart';
import '../pages/App.dart';
import '../pages/Login/Login.dart';
import '../pages/NotFind/not_find.dart';


/// 根目录
Handler rootHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return App();
});

/// 登录
Handler loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});

/// webview
Handler webviewHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final String title = Application.chineseDecode(params['title']?.first);
  final String link = Application.chineseDecode(params['link']?.first);
  return WebViewPage(title, link);
});

/// 设置
Handler settingHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Setting();
});

/// 404
Handler notFindHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return  NotFind();
});
