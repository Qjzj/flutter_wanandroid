import 'package:flutter/material.dart';
import 'package:flutter_learn/routes/application.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QCSwiper extends StatelessWidget {

  final List data;
  QCSwiper(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750),
      height: ScreenUtil.getInstance().setHeight(420),
      child: Swiper(
        itemCount: data.length,
        autoplay: true,
        pagination: SwiperPagination(alignment: Alignment.bottomRight, margin: EdgeInsets.only(right: 20, bottom: 40)),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              onTap: () {
                final String title = Application.chineseEncode(data[index]['title']);
                final String link = Application.chineseEncode(data[index]['url']);
                final String path = '/webview?title=$title&link=$link';
                Application.router.navigateTo(context, path);
              },
              child: Stack(
                children: <Widget>[
                  Image.network(data[index]['imagePath'], fit: BoxFit.cover, height: ScreenUtil.getInstance().setHeight(420),),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: ScreenUtil.getInstance().setHeight(60),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: ScreenUtil.getInstance().setHeight(60),
                      child: Text(
                        '   ' + data[index]['title'],
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: Color.fromARGB(50, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void itemClick (String link) {
    print(link);
  }
}