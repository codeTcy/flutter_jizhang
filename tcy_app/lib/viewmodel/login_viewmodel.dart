import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcy_app/eventbus/event_bus.dart';
import 'package:tcy_app/global/Global.dart';
import 'package:tcy_app/main.dart';
import 'package:tcy_app/model/login_model.dart';
import 'package:tcy_app/utils/event_utils.dart';
import 'package:tdui/tdui.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLogin = false;
  TextEditingController _user;
  TextEditingController _pass;

  bool get getIsLogin {
    return _isLogin;
  }

  void setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void login(String user, String pass) async {
    setIsLogin(true);
    if (user.isEmpty) {
      setIsLogin(false);
      print("账号不能为空！");
      return;
    } else if (pass.isEmpty) {
      setIsLogin(false);
      print("密码不能为空！");
      return;
    }
    SharedPreferences sp = await SharedPreferences.getInstance();
    Response result = await LoginModel(user, pass);
    print(result);
    if (result.data["success"]) {
      print("success");
      Global.getInstance().token = result.data["data"]["token"];
      Global.getInstance().user = result.data["data"]["user"];
      sp.setString("token", result.data["data"]["token"]);
      Global.getInstance().dio.options.headers["token"] =
          result.data["data"]["token"];
      bus.emit(
        "登录成功跳转",
        {
          "view": "login",
          "message": "登录成功跳转",
        },
      );
    } else {
      print("fail");
    }
    setIsLogin(true);
  }

  void loginByToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Response result = await LoginTokenModel();
    print("result的token:" + result.data["token"].toString());
    if (result.data["success"]) {
      Global.getInstance().user = result.data["data"];
      bus.emit(
        "Token登录成功",
        {
          "view": "originLogin",
          "message": "Token登录成功跳转",
        },
      );
    } else {
      sp.remove("token");
    }
  }
}
