import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'package:flutterdemo/utils.dart';

/**
 * 装饰盒子
 * DecoratedBox可以在其子widget绘制前(或后)绘制一个装饰Decoration（如背景、边框、渐变等）
 */
class DecorationBoxs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.blueGrey]),
          //背景渐变
          border: Border.all(width: 1, color: Colors.lightGreenAccent),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}

Widget DecorationBoxSmaple = Scaffold(
  appBar: getAppBar('DecorationBox 装饰盒子'),
  body: Center(
    child: DecorationBoxs(),
  ),
);
