import 'package:flutter/material.dart';
import 'package:tcy_app/global/Global.dart';
import 'package:tcy_app/utils/rsa/rsa_utils.dart';

Future LoginModel(String user, String pass) async {
  String pwd = await encodeString(pass);
  print(pwd);
  var result = await Global.getInstance().dio.post(
    "/zxw/user",
    queryParameters: {
      "username": user,
      "password": pwd,
    },
  );
  return result;
}
