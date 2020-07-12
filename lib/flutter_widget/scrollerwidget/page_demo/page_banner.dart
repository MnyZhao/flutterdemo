import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class banner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bannerState();
  }
}

class bannerState extends State<banner> {
  List<String> list = [
    'images/leak.jpg',
    'images/place_holder_2.jpg',
    'images/sea.jpg'
  ];
  List<Widget> listDoats = [];
  PageController _controller = PageController();
  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listDoats = DoasIndicator(list.length, currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.greenAccent,
        height: 180,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView.builder(
              onPageChanged: (num) {
                setState(() {
                  listDoats = DoasIndicator(list.length, num);
                });
              },
              controller: _controller,
              itemBuilder: (BuildContext context, int num) {
                return Image(
                  image: AssetImage(list[num]),
                  fit: BoxFit.cover, //缩放模式
                );
              },
              itemCount: list.length,
            ),
            Positioned(
              bottom: 5,
              child: Row(
                children: listDoats, //DoasIndicator(list.length, currentIndex),
              ),
            )
          ],
        ));
  }
}

// 点指示器
List<Widget> DoasIndicator(int dotsCount, int currentPage) {
  List<Widget> list = new List<Widget>();
  for (int i = 0; i < dotsCount; i++) {
    list.add(Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == i ? Colors.redAccent : Colors.grey,
      ),
    ));
  }
  return list;
}

// 单个点
class Dots extends StatelessWidget {
  bool isCheck;
  Color selectColor;
  Color unSelectColor;

  Dots.config(
      bool check, {
        Color selectColor = Colors.grey,
        Color unSelectColor = Colors.redAccent,
      }) {
    this.isCheck = check;
    this.selectColor = selectColor;
    this.unSelectColor = unSelectColor;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCheck ? selectColor : unSelectColor,
      ),
    );
  }
}
Widget banners = Scaffold(
  appBar: getAppBar("banner"),
  body: banner(),
);
