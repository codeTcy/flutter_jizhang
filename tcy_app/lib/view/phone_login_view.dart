import 'package:flutter/material.dart';
import 'package:tcy_app/eventbus/event_bus.dart';
import 'package:tcy_app/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneLoginView extends StatefulWidget {
  @override
  _PhoneLoginViewState createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {
  TextEditingController _user;
  TextEditingController _pass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = new TextEditingController();
    _pass = new TextEditingController();
    // 订阅
    bus.on("登录成功跳转", (arg) {
      if (arg["view"] == "login") {
        Navigator.of(context).popAndPushNamed("menuView");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _pass.dispose();
    // 取消订阅
    bus.off("登录成功跳转");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              TextField(
                // keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: "请输入手机号",
                  hintMaxLines: 1,
                ),
                controller: _user,
                autofocus: true,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 8.h),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  hintText: "请输入密码",
                  hintMaxLines: 1,
                ),
                controller: _pass,
                obscureText: true,
                textInputAction: TextInputAction.send,
              ),
              SizedBox(height: 64.h),
              Container(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.black, fontSize: 17.sp),
                  ),
                  onPressed: _loginAction,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 30.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        child: Text(
                          "找回密码",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      onTap: () {
                        print("找回密码");
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        child: Text(
                          "注册",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      onTap: _registeAction,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 250.h),
              Container(
                child: Text(
                  "其他登录方式",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    "微信登录",
                    style: TextStyle(color: Colors.black, fontSize: 17.sp),
                  ),
                  onPressed: () {
                    print("微信登录");
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    "通过Apple登录",
                    style: TextStyle(color: Colors.black, fontSize: 17.sp),
                  ),
                  onPressed: () {
                    print("通过Apple登录");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginAction() {
    context
        .read<LoginViewModel>()
        .login(_user.text.toString(), _pass.text.toString());
  }

  void _registeAction() {
    Navigator.of(context).pushNamed("registerView");
  }
}
