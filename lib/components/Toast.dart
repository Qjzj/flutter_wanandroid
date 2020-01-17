import 'package:flutter/material.dart';

class Toast {
  static void show({@required BuildContext context, @required String message}) {
    OverlayEntry overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.75,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      );
    });

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
