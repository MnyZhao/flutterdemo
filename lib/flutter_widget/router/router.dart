import "package:flutter/material.dart";

import '../../utils.dart';
import 'dynamicnavigator/Login.dart';
import 'navigto_animation/naviter_animation.dart';
class Router extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("路由跳转"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("静态路由需要绑定到materialapp 的routes中 详情看page1"),
          Text("用户名 mny 密码 123"),
          getFlatButton(Text("动态路由"), Login()),
          getFlatButton(Text("界面切换过度动画"), NaviterAniamtion()),
        ],
      ),
    );
  }

}