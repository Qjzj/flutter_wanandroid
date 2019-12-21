import './http.dart';
import '../config/config.dart';

Future login (username, password) async {
  String url = baseUrl + '/user/login';
  Map<String, dynamic> data = new Map();
  data['username'] = username;
  data['password'] = password;
  return await Http.post(url, data: data);
}