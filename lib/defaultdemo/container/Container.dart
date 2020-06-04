import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

class MContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200.0,
      height: 200.0,
      //color 在源码中也是转换成decoration设置的 用了decoration color 设置无效
//      color: Colors.amber,
      //背景
      decoration: BoxDecoration(
        gradient: RadialGradient(
            //背景径向渐变
            colors: [Colors.red, Colors.orange],
            center: Alignment.topLeft,
            radius: .98),
        border: Border.all(color: Colors.lightGreen, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        boxShadow: [
          //卡片阴影
          BoxShadow(
              color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
        ],
      ),
      //变化
      transform: Matrix4.skewY(0.3),
      child: Center(
        child: Text(
          'Container',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Container',
    home: Scaffold(
      appBar: new BaseAppBar(titleMsg: 'Container').getAppBar(),
      body: MContainer(),
    ),
  ));
}
