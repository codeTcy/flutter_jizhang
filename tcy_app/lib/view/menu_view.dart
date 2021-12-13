import 'package:flutter/material.dart';
import 'package:tcy_app/base/bar_view.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarActionAndLeading(
          "菜单",
          [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed("themeColorView");
              },
            ),
          ],
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).popAndPushNamed("/");
            },
          )),
    );
  }
}
