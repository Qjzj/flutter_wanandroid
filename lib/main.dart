import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/Launch/Lauch.dart';
import 'package:flutter_learn/pages/Launch/Lauch.dart';
import 'package:fluro/fluro.dart';
import './routes/application.dart';
import './routes/routes.dart';
import 'package:provide/provide.dart';
import './Provider/user_provider.dart';


void main () {
  UserProvider userProvider = UserProvider();
  Providers providers = Providers();
  providers..provide(Provider<UserProvider>.value(userProvider));

  runApp(ProviderNode(child: MyApp(), providers: providers,));
  // 设置statusbar 沉浸式体验
  if(Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {

  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩Android',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      home: Launch(),
    );
  }
}