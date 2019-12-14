import 'package:flutter/material.dart';
import 'package:flutter_learn/Provider/theme_provider.dart';
import 'package:provide/provide.dart';
import '../../components/bar_item.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text('设置', style: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: Container(
        color: Color.fromARGB(50, 200, 200, 200),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ThemeItem(),
                  BarItemNotLeading(title: '版本', trailing: Text('0.10', style: TextStyle(color: Colors.black54, fontSize: 15),),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  
}

class ThemeItem extends StatefulWidget {
  @override
  _ThemeItemState createState() => _ThemeItemState();
}

class _ThemeItemState extends State<ThemeItem> {
  final double ratio = 4 / 3;
  final double mainSpacing = 8;
  final double crossSpacing = 5;
  final int count = 5;
  double maxHeight = 0;
  bool isOpen;
  double height;

  @override
  void initState() {
    isOpen = false;
    height = 0.0;
    _getMaxHeight();
    setState(() {
      // maxHeight = _getManHeight();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvider>(
        builder: (BuildContext context, child, theme) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            itemLine(theme.currentTheme),
            themeView(theme.colors),
          ],
        ),
      );
    });
  }

  /// 主题item
  Widget itemLine(Color color) {
    return InkWell(
      onTap: toggle,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
        height: 45,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text('主题',
                  style: TextStyle(color: Colors.black87, fontSize: 16)),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 30,
              height: 25,
              color: color,
            ),
            Icon(
                isOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                size: 18,
                color: Colors.black45)
          ],
        ),
      ),
    );
  }

  /// 主题list
  Widget themeView(List<Color> colors) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutQuart,
      height: height,
      child: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: mainSpacing,
              crossAxisSpacing: crossSpacing,
              childAspectRatio: ratio),
          shrinkWrap: true,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Provide.value<ThemeProvider>(context).setTheme(index);
                toggle();
              },
              child: Container(
                color: colors[index],
              ),
            );
          },
        ),
      ),
    );
  }

  _getMaxHeight() {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      int colorsLen = Provide.value<ThemeProvider>(context).colors.length;
      int _lines = (colorsLen / count).ceil();
      double _width = MediaQuery.of(context).size.width;
      double _itemWidth = (_width - 20 - (count - 1) * crossSpacing) / count;
      double _itemHeight = _itemWidth / ratio;
      double _maxHeight = _itemHeight * _lines + mainSpacing * (_lines - 1);
      setState(() {
        maxHeight = _maxHeight;
      });
    });
  }

  // 切换主题内容显示
  toggle() {
    if (isOpen) {
      setState(() {
        height = 0;
      });
    } else {
      setState(() {
        height = maxHeight;
      });
    }
    setState(() {
      isOpen = !isOpen;
    });
  }
}
