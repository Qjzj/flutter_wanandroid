import 'package:flutter/material.dart';

class BarItemNotLeading extends StatelessWidget {
  final String title;
  final Function onTap;
  final Widget trailing ;

  BarItemNotLeading({@required this.title, this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(onTap != null) {
          onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            Container(
              child: trailing,
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_right, color: Colors.black45, size: 18)
          ],
        ),
      ),
    );
  }
}
