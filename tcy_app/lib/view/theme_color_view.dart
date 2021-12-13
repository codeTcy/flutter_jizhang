import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcy_app/base/bar_view.dart';
import 'package:tcy_app/global/ThemeColor.dart';
import 'package:tcy_app/viewmodel/theme_color_viewmodel.dart';

class ThemeColorView extends StatefulWidget {
  @override
  _ThemeColorViewState createState() => _ThemeColorViewState();
}

class _ThemeColorViewState extends State<ThemeColorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("设置主题颜色"),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: themes.length,
          shrinkWrap: true,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: themes[index],
          ),
          child: Provider.of<ThemeColorViewModel>(context).getColor == index
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.verified_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    )
                  ],
                )
              : Row(),
        ),
        onTap: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setInt("ThemeColors", index);
          context.read<ThemeColorViewModel>().setColors(index);
        },
      ),
    );
  }
}
