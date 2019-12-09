import './http.dart';

Future getBanner() async {
  return await Http.get('https://www.wanandroid.com/banner/json');
}
Future getHomeData(int pageNum) async {
  String url = 'https://www.wanandroid.com/article/list/$pageNum/json';
  return await Http.get(url);
}