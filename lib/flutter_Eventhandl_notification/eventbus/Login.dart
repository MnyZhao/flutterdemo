import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'eventbus_controller.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("Login"),
      body: ListView(
        children: [
          Text(" 点击按钮通过eventbus 发送数据返回Home 查看是否接收"),
          FlatButton(onPressed: () {
            bus.emit("Login", "登陆成功");
          }, child: Text("Click")),
        ],
      ),
    );
  }

}