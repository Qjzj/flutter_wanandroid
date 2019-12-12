import 'dart:convert';

import 'package:fluro/fluro.dart';

class Application {
  static Router router;
  static String chineseEncode(String string) {
    return json.encode(Utf8Encoder().convert(string));
  }

  static String chineseDecode(String string) {
    List<int> list = [];
    json.decode(string).forEach((item) => list.add(item));

    return Utf8Decoder().convert(list);
  }
}