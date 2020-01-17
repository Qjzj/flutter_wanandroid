import 'package:flutter/material.dart';
import 'package:flutter_learn/routes/application.dart';
import 'package:provide/provide.dart';
import '../../Provider/user_provider.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  bool isLogin;

  @override
  void initState() {
    super.initState();
    jumpPage();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575719989600&di=a87a86b1475c92c9692cacdaa3b55644&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201601%2F30%2F20160130164713_K8sZm.png',
        fit: BoxFit.fill,
      ),
    );
  }

  jumpPage() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      isLogin = Provide.value<UserProvider>(context).isLogin;
      if (isLogin) {
        
        Application.router.navigateTo(context, '/', replace: true);
      } else {
        Application.router.navigateTo(context, '/login', replace: true);
      }
    });
  }
}
