import 'package:flutter/material.dart';
import 'package:flutterdemo/flutter_Eventhandl_notification/eventbus/eventbus_controller.dart';
import 'package:flutterdemo/utils.dart';

import 'Login.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var msg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bus.on("Login", (arg) {
      if (arg is String) {
        setState(() {
          msg = arg;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Home"),
      body: ListView(
        children: [
          Text("跳转去Login 点击按钮 并在本界面接收消息"),
          getFlatButton(Text("goLogin"), Login()),
          Text('$msg')
        ],
      ),
    );
  }
}
