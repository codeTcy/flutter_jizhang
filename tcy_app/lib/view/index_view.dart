import 'package:flutter/material.dart';
import 'package:tcy_app/base/bar_view.dart';

class IndexView extends StatefulWidget {
  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("首页"),
    );
  }
}
