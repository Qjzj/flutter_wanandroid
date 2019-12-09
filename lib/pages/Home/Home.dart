import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../api/homeAPi.dart';
import '../../components/swiper.dart';
import './components/ArticleList.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int pageNum = 0;
  bool isLoad = false;
  bool noData = false;
  List swiperData = [];
  List articleData = [];
  EasyRefreshController _controller;
  

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    getBanner().then( (data) {
      setState(() {
        swiperData = data['data'] as List;
      });
    });
    searchArticle(pageNum);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        body: Container(
          child: EasyRefresh(
            controller: _controller,
            onRefresh: refresh,
            onLoad: onload,
            header: ClassicalHeader(
              refreshText: '下拉刷新',
              refreshReadyText: '正在刷新...',
              refreshedText: '刷新完成',
              refreshFailedText: '刷新失败',
              showInfo: true,
              infoText: '${DateTime.now().hour < 10 ? '0' + DateTime.now().hour.toString() : DateTime.now().hour}:${DateTime.now().minute < 10 ? '0' + DateTime.now().minute.toString() : DateTime.now().minute}'
            ),
            footer: ClassicalFooter(
              loadedText: '加载完成',
              loadFailedText: '加载失败',
              loadingText: '正在加载...',
              loadReadyText: '松开加载',
              loadText: '上拉加载',
              showInfo: false,
              noMoreText: '没有更多数据了'
            ),
            child: ListView(
              children: <Widget>[
                QCSwiper(swiperData),
                ArticleList(articleData),
              ],
            ),
          ),
        ),
        
      );
  }

  Future refresh() async {
    setState(() {
      pageNum = 0;
    });
    await searchArticle(0);
    _controller.resetLoadState();
    _controller.finishRefresh();
  }

  Future onload() async {
    await searchArticle(pageNum);
    _controller.finishLoad(success: true, noMore: noData);
  }

  Future searchArticle(currentPage) async {
    try {
      var result = await getHomeData(pageNum);
      var noData = false;
      if(result['errorCode'] == 0) {
        if(result['data']['datas'].length < result['data']['size']) {
          noData = true;
        }
      }

      setState(() {
        this.noData = noData;
        if(pageNum <= 5) {
          pageNum += 1;
        }else {
          pageNum = 500;
        }
        
        if(currentPage == 0) {
          this.articleData = result['data']['datas'];
        }else {
          this.articleData.addAll(result['data']['datas']);
        }
        print('当前页$pageNum');
        print('当前请求的数据长度${result['data'].length}');
        print('数据长度${this.articleData.length}');
      });
      
    }catch (e) {
      print('请求文章失败$e');
    }
  }
}