import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

/**
 *  层叠布局
 *  层叠布局和Web中的绝对定位、Android中的Frame布局是相似的，
 *  子widget可以根据到父容器四个角的位置来确定本身的位置。
 *  绝对定位允许子widget堆叠（按照代码中声明的顺序）。
 *  Flutter中使用Stack和Positioned来实现绝对定位，Stack允许子widget堆叠，
 * 而Positioned可以给子widget定位（根据Stack的四个角）。
 */
class MStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return //通过ConstrainedBox来确保Stack占满屏幕
      ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: new BaseAppBar(titleMsg: '层叠布局').getAppBar(),
        body: MStack(),
    ),
  ));
}