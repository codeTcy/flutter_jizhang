import 'package:flutter/material.dart';
import 'package:tcy_app/global/ThemeColor.dart';

class ThemeColorViewModel extends ChangeNotifier {
  int _color = 0;

  int get getColor {
    return _color;
  }

  void setColors(int index) {
    if (index > themes.length - 1) return;
    _color = index;
    notifyListeners();
  }
}
