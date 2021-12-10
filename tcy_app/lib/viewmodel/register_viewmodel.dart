import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _checkAgree = false;

  bool get getCheck {
    return _checkAgree;
  }

  void setCheck(bool value) {
    _checkAgree = value;
    notifyListeners();
  }
}
