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
    return SizedBox(
        width: 30,
        height: 30,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (num) {
                setState(() {
                  //这不应该是没更新一次状态就重新添加一个点集合 而是应该对应状态进行修改
                  // 后面有时间在完善
                  listDoats = DoasIndicator(list.length, num);
                });
              },
              controller: _controller,
              itemBuilder: (BuildContext context, int num) {
                return SizedBox(
                    width: 30,
                    height: 20,
                    child: Image(
                      height: 20,
                      image: AssetImage(list[num]),
                      fit: BoxFit.none, //缩放模式
                    ));
              },
              itemCount: list.length,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 5,
              child: Center(
                child: Row(
                  children:
                      listDoats, //DoasIndicator(list.length, currentIndex),
                ),
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
