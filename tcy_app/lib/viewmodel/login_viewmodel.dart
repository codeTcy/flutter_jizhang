import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tcy_app/main.dart';
import 'package:tcy_app/model/login_model.dart';
import 'package:tdui/tdui.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLogin = false;
  TextEditingController _user;
  TextEditingController _pass;

  bool get getIsLogin {
    return _isLogin;
  }

  TextEditingController get getUser {
    if (_user == null) _user = new TextEditingController();
    return _user;
  }

  TextEditingController get getPass {
    if (_pass == null) _pass = new TextEditingController();
    return _pass;
  }

  void setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void login(BuildContext context, String user, String pass) async {
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

    Response result = await LoginModel(user, pass);
    print(result);
    if (result.data["success"]) {
      print("success");
      Navigator.of(context).popAndPushNamed("menuView");
    } else {
      print("fail");
    }
  }
}
