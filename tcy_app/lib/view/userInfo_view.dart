import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcy_app/base/bar_view.dart';
import 'package:tcy_app/global/Global.dart';

class UserInfoView extends StatefulWidget {
  @override
  _UserInfoViewState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarAction("个人中心", [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).pushNamed("themeColorView");
          },
        ),
      ]),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(Global.getInstance().user["name"]),
              accountEmail: Text(Global.getInstance().user["phone"]),
            ),
            ListTile(
              title: Text("退出登陆"),
              trailing: Icon(Icons.exit_to_app),
              onTap: _onTap,
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    Navigator.of(context).popAndPushNamed("/");
  }
}
