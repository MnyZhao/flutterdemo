import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'eventbus/Home.dart';
import 'gesture/GestureDetectorDefault.dart';
import 'gesture/GestureSmaple.dart';
import 'notification.dart';

class EventNotifySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: getAppBar("事件处理与通知"),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            getFlatButton(Text("事件处理"), GestureSmaple()),
            getFlatButton(Text("通知"), NotificationSample),
            Text("在APP中，我们经常会需要一个广播机制，用以跨页面事件通知，"
                "比如一个需要登录的APP中，页面会关注用户登录或注销事件，"
                "来进行一些状态更新。这时候，一个事件总线便会非常有用，"
                "事件总线通常实现了订阅者模式，订阅者模式包含发布者和订阅者两种角色，"
                "可以通过事件总线来触发事件和监听事件"),
            getFlatButton(Text("事件总线"), Home()),
          ],
        ));
  }
}
