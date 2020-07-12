import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          //_lastPressedAt 或者时间大于1秒
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }

          return true;
        },
        child: Scaffold(
            appBar: getAppBar("一秒内点击两次退出"),
            body: Container(
                alignment: Alignment.center, child: Text("1秒内连续按两次返回键退出"))));
  }
}
