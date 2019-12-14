import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluro/fluro.dart';

class Application {
  static Router router;
  static SharedPreferences spfs;
  /// 中文编码
  static String chineseEncode(String string) {
    return json.encode(Utf8Encoder().convert(string));
  }
  /// 中文解码
  static String chineseDecode(String string) {
    List<int> list = [];
    json.decode(string).forEach((item) => list.add(item));

    return Utf8Decoder().convert(list);
  }
}