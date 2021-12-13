import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tcy_app/model/register_model.dart';
import 'package:tcy_app/utils/date_utils.dart';
import 'package:tcy_app/utils/rsa/rsa_utils.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _checkAgree = false;

  bool get getCheck {
    return _checkAgree;
  }

  void setCheck(bool value) {
    _checkAgree = value;
    notifyListeners();
  }

  void register(String phoneData) async {
    print("phoneData:" + phoneData);
    DateTime dateTime = new DateTime(2017, 9, 7, 17, 30);
    String user = phoneData;
    String pwd = await encodeString("1");
    String phone = phoneData;
    String name = "pp";
    int gender = 1;
    String birthday = getYMD(dateTime);
    int solar = 1;

    Response result = await RegisterModel(
      json.encode({
        "username": user,
        "password": pwd,
        "phone": phone,
        "name": name,
        "gender": gender,
        "birthday": birthday,
        "solar": solar,
      }),
    );
    print(result);

    if (result.data["success"]) {
      print(result.data["msg"]);
    } else {
      // EasyLoading.showError(result.data["msg"]);
      print(result.data["msg"]);
    }
  }
}
