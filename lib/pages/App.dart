import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/Home/Home.dart';
import 'package:flutter_learn/pages/KnowledgeSystem/knowledge_system.dart';
import 'package:flutter_learn/pages/Navigation/navigation.dart';
import 'package:flutter_learn/pages/Project/project.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with AutomaticKeepAliveClientMixin {

  int currentIndex;
  GlobalKey<ScaffoldState> _scafflodState = GlobalKey<ScaffoldState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scafflodState,
      appBar: AppBar(
          title: Text('玩Android', style: TextStyle(color: Colors.white),),
          leading: InkWell(
            onTap: () {
              _scafflodState.currentState.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                print('wahhhhhhhh');
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10.0,),
          ],
        ),
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomePage(),
          KnowledgeSystemPage(),
          NavigationPage(),
          ProjectPage()
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  // image: NetworkImage('https://goss.veer.com/creative/vcg/veer/800water/veer-312853531.jpg')
                  image: NetworkImage('https://goss.veer.com/creative/vcg/veer/800water/veer-305311069.jpg')
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(5.0),
                color: Color.fromARGB(50, 0, 0, 0),
                child:  Column(
                  children: <Widget>[
                    Container(
                      height: 35,
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white,),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipOval(
                            child: Image.network(
                              'https://dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1470810757,33514013&fm=58',
                              width: 70,
                              height: 70,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,//dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1470810757,33514013&fm=58,
                              children: <Widget>[
                                Text('花开不败', style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                )),
                                SizedBox(height: 12,),
                                Text(
                                  '你若盛开,蝴蝶自来,你若精彩,天自安排',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white, fontSize: 15,),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ListTile(
                title: Text('Item1'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black26, size: 16,),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getBottomNavigationItems(),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }


  List<BottomNavigationBarItem> _getBottomNavigationItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.device_hub),
        title: Text('知识体系'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.navigation),
        title: Text('导航'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.folder_special),
        title: Text('项目'),
      )
    ];
  }


}