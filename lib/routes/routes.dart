import 'package:fluro/fluro.dart';
import './route_handlers.dart';


class Routes {

  static const rootPath = "/";
  static const loginPath = "/login";
  static const webviewPath = "/webview";
  static const settingPath = '/setting';

  static void configureRoutes(Router router) {
    /// 404
    router.notFoundHandler = notFindHandler;
    /// root
    router.define(rootPath, handler: rootHandler);
    /// 登录
    router.define(loginPath, handler: loginHandler);
    /// webview
    router.define(webviewPath, handler: webviewHandler);
    /// 设置
    router.define(settingPath, handler: settingHandler);
  }
}
