import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  List<Color> colors = [
    Colors.pink,
    Colors.purple,
    Colors.lightBlue,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.orange,
    Colors.teal,
    Colors.indigo
  ];

  Color currentTheme;

  setTheme(int index) async {
    currentTheme = colors[index];
    SharedPreferences sps = await SharedPreferences.getInstance();
    await sps.setInt('themeIndex', index);
    notifyListeners();
  }
}