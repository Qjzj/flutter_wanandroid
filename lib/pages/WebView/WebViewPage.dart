import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {

  final String title;
  final String link;

  WebViewPage(this.title, this.link);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: link,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 0),
          child: Text(title, style: TextStyle(color: Colors.white))
        ),
      ),
    );
  }
}