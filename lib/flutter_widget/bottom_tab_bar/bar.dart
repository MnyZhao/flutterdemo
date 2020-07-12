import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'BottomNavPagerView.dart';
import 'MaterialUi.dart';
import 'TabBartest.dart';
import 'bottomnavigationbar.dart';

class ShowBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("导航栏"),
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30),
        children: [
          Text("底部导航栏"),
          getFlatButton(Text("BottomNavigationBar"), BottomNavigation()),
          Text(
              "顶部导航栏 tabbar + tabbarView 就可以实现android tablayout + viewpager的效果"),
          getFlatButton(Text("MTabBarSample"), MTabBarSample()),
          Text("顶部导航栏组合底部导航栏"),
          getFlatButton(Text("MaterialUI"), MaterialUI()),
          Text("底部导航栏+pageView"),
          getFlatButton(Text("BottomNav_PageView"), BottomNav_PageView())
        ],
      ),
    );
  }
}
