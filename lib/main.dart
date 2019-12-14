import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/Launch/Lauch.dart';
import 'package:flutter_learn/pages/Launch/Lauch.dart';
import 'package:fluro/fluro.dart';
import './routes/application.dart';
import './routes/routes.dart';
import 'package:provide/provide.dart';
import './Provider/user_provider.dart';
import './Provider/theme_provider.dart';


void main () async {
  // 初始化provide
  UserProvider userProvider = UserProvider();
  ThemeProvider themeProvider = ThemeProvider();
  Providers providers = Providers();
  providers..provide(Provider<UserProvider>.value(userProvider))
  ..provide(Provider<ThemeProvider>.value(themeProvider));

  /// 初始化持久化数据
  Application.spfs = await SharedPreferences.getInstance();

  runApp(ProviderNode(child: MyApp(), providers: providers,));
  // 设置statusbar 沉浸式体验
  if(Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    getThemeIndex().then((index) => Provide.value<ThemeProvider>(context).setTheme(index));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     return Provide<ThemeProvider>(builder: (BuildContext context, child, theme) {
      return MaterialApp(
        title: '玩Android',
        theme: ThemeData(
          primaryColor: theme.currentTheme,
        ),
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        home: Launch(),
      );
    });
  }

  Future<int> getThemeIndex() async {
    return Application.spfs.getInt('themeIndex') ?? 0;   
  }
}