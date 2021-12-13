import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcy_app/routers/router.dart';
import 'package:tcy_app/viewmodel/login_viewmodel.dart';
import 'package:tcy_app/viewmodel/register_viewmodel.dart';
import 'package:tcy_app/viewmodel/theme_color_viewmodel.dart';

import 'global/ThemeColor.dart';

final GlobalKey<NavigatorState> navigatorKey =
    new GlobalKey<NavigatorState>(); // 利用navitaorKey.currentContext获取上下文对象

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  int colors = await sp.getInt("ThemeColors") ?? 0;
  ThemeColorViewModel themeColorViewModel = new ThemeColorViewModel();
  themeColorViewModel.setColors(colors);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (context) => themeColorViewModel),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 823),
      builder: () => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          primaryColor:
              themes[Provider.of<ThemeColorViewModel>(context).getColor],
        ),
        routes: routes,
        builder: (context, widget) {
          // EasyLoading.init();
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        // builder: EasyLoading.init(),
      ),
    );

    // return MaterialApp(
    //   navigatorKey: navigatorKey,
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData.light().copyWith(
    //     primaryColor:
    //         themes[Provider.of<ThemeColorViewModel>(context).getColor],
    //   ),
    //   routes: routes,
    // );
  }
}
