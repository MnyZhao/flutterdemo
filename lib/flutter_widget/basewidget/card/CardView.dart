import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

/// Card 内部 允许有一个子widget 但是该子widget 可以是
/// 是Row，Column或其他包含子级列表的widget
//显示圆角和阴影
//Card内容不能滚动
class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: getAppBar("卡片布局"),
        body: Card(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            width: double.infinity,
            height: 90,
          ),
          color: Colors.white,
          elevation: 10,// 阴影大小
          shadowColor: Colors.grey,
          // shape 阴影样式默认是[RoundedRectangleBorder] 圆角半径为4.0
//          shape:
//              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ));
  }
}

main() => runApp(MaterialApp(home: CardView()));
