import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
