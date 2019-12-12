import 'package:flutter/material.dart';
import '../../../routes/application.dart';

class ArticleList extends StatelessWidget {
  final List data;

  ArticleList(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ArticleItem(data[index]);
        },
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final Map<String, dynamic> data;
  ArticleItem(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final String title = Application.chineseEncode(data['title']);
        final String link = Application.chineseEncode(data['link']);
        final String path = '/webview?title=$title&link=$link';
        Application.router.navigateTo(context, path);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                    style: BorderStyle.solid))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(TextSpan(
                    text: '类别: ',
                    children: [
                      TextSpan(
                          text: data['superChapterName'] +
                              '/' +
                              data['chapterName'],
                          style: TextStyle(
                            color: Colors.orangeAccent,
                          ))
                    ],
                    style: TextStyle(fontSize: 13.0))),
                Text(
                  '时间: ' + (data['niceDate'] ?? data['niceShareDate']),
                  style: TextStyle(fontSize: 13.0),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                data['title'],
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: <Widget>[
                (data['tags'] as List).length > 0
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(data['tags'][0]['name']),
                      )
                    : Container(),
                Text.rich(TextSpan(text: '作者: ', children: [
                  TextSpan(
                      text: '张国林',
                      style:
                          TextStyle(color: Color.fromARGB(255, 105, 230, 149)))
                ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
