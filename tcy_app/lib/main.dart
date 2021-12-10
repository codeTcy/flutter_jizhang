import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcy_app/routers/router.dart';
import 'package:tcy_app/viewmodel/login_viewmodel.dart';
import 'package:tcy_app/viewmodel/register_viewmodel.dart';

final GlobalKey<NavigatorState> navigatorKey =
    new GlobalKey<NavigatorState>(); // 利用navitaorKey.currentContext获取上下文对象

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
