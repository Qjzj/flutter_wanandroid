import 'package:flutter/material.dart';

class NotFind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Center(
          child: Text(
            '哎呀, 页面不见啦',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 18
            ),
          ),
        ),
      )
    );
  }
}