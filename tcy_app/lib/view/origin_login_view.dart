import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcy_app/eventbus/event_bus.dart';
import 'package:tcy_app/global/Global.dart';
import 'package:provider/provider.dart';
import 'package:tcy_app/viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bus.on("Token登录成功", (arg) {
      if (arg["view"] == "originLogin") {
        Navigator.of(context).popAndPushNamed("menuView");
      }
    });
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bus.off("Token登录成功");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 600,
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text(
                  "微信登录",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                onPressed: () {
                  print("微信登录");
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text(
                  "通过Apple登录",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                onPressed: () {
                  print("通过Apple登录");
                },
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              child: Text(
                "更多登录方式",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              onTap: _ontap,
            ),
          ],
        ),
      ),
    );
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = await sp.getString("token");
    if (token != null) {
      print("我的Token:" + token);
      Global.getInstance().dio.options.headers["token"] = token;
      context.read<LoginViewModel>().loginByToken();
    }
  }

  void _ontap() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text("注册"),
            onPressed: _registerAction,
          ),
          CupertinoActionSheetAction(
            child: Text("手机登录"),
            onPressed: _phoneLoginAction,
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void _phoneLoginAction() {
    Navigator.of(context).pop(); // 把phoneLogin作为根view
    Navigator.of(context).popAndPushNamed("phoneLoginView");
  }

  void _registerAction() {
    Navigator.of(context).popAndPushNamed("registerView");
  }
}
