import 'dart:math';

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

  static Future post(String url, {Map<String, dynamic> data}) async {
    Response result;
    if(data == null) {
      data = new Map();
    }
    try {
      result = await dio.post(url, data: data);
      return result.data;
    }catch (e) {

    }
  }
}
