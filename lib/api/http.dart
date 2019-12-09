import 'package:dio/dio.dart';

Dio dio = new Dio();

class Http {
  static Future get(String url, {Map<String, dynamic> params}) async {
    Response result;
    print('请求url$url');
    try {
      if (params == null) {
        result = await dio.get(url);
      } else {
        result = await dio.get(url, queryParameters: params);
      }
      return result.data;
    } catch (e) {
      print('请求数据出错$e');
    }
  }
}
