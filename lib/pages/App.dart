import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/Home/Home.dart';
import 'package:flutter_learn/pages/KnowledgeSystem/knowledge_system.dart';
import 'package:flutter_learn/pages/Navigation/navigation.dart';
import 'package:flutter_learn/pages/Project/project.dart';
import './Drawer/qj_drawer.dart';


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
      drawer: QJDrawer(),
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