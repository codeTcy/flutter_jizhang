import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: CustomSwiper(),
            ),
            Text("data"),
          ],
        ),
      ),
    );
  }
}

class CustomSwiper extends StatefulWidget {
  @override
  _CustomSwiperState createState() => _CustomSwiperState();
}

class _CustomSwiperState extends State<CustomSwiper> {
  @override
  Widget build(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://i0.hdslb.com/bfs/album/1a8b91d634a156c75d93f85340d72cefb07c0a88.jpg",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      autoplay: false,
    );
  }
}
