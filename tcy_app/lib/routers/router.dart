import 'package:flutter/material.dart';
import 'package:tcy_app/view/menu_view.dart';
import 'package:tcy_app/view/origin_login_view.dart';
import 'package:tcy_app/view/phone_login_view.dart';
import 'package:tcy_app/view/register_view.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginView(), // 首页登录
  "registerView": (BuildContext context) => RegisterView(), // 注册界面
  "phoneLoginView": (BuildContext context) => PhoneLoginView(), // 注册界面
  "menuView": (BuildContext context) => MenuView(), // 注册界面
};
