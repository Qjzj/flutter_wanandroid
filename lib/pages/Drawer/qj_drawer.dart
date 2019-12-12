import 'package:flutter/material.dart';

class QJDrawer extends StatefulWidget {
  @override
  _QJDrawerState createState() => _QJDrawerState();
}

class _QJDrawerState extends State<QJDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          QCDrawerHeader(),
          SizedBox(height: 10),
          ListItem('消息', icon: Icons.notifications),
          ListItem('收藏', icon: Icons.collections),
          ListItem('设置', icon: Icons.settings),
          ListItem(
            '分享',
            icon: Icons.share,
          ),
          ListItem(
            '关于',
            icon: Icons.swap_calls,
          )
        ],
      ),
    );
  }
}

class QCDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            // image: NetworkImage('https://goss.veer.com/creative/vcg/veer/800water/veer-312853531.jpg')
            image: NetworkImage(
                'https://goss.veer.com/creative/vcg/veer/800water/veer-305311069.jpg')),
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Color.fromARGB(50, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 35,
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .start, //dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1470810757,33514013&fm=58,
                      children: <Widget>[
                        Text('花开不败',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '你若盛开,蝴蝶自来,你若精彩,天自安排',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
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
    );
  }
}

class ListItem extends StatelessWidget {
  final Function tapItem;
  final String title;
  final IconData icon;
  ListItem(this.title, {@required this.icon, this.tapItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (tapItem != null) {
          tapItem();
        }
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              width: 45,
              child: Center(
                child: Icon(icon, color: Colors.black45, size: 22),
              ),
            ),
            SizedBox(width: 5,),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: 18, color: Colors.black87),),
            ),
            Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black26,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
