import 'package:flutter/material.dart';
import 'point.dart';
import 'scale_update.dart';
import 'package:flutterdemo/utils.dart';

import 'GestureDetectorDefault.dart';
import 'drag_drop.dart';
import 'gesture_recoginzer.dart';

class GestureSmaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("手势检测"),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          Text("手势检测"),
          getFlatButton(Text("基础手势检测 单击 双击 长按"), GestureDecetor()),
          getFlatButton(Text("点击给部分文字换颜色->recognizer"), Recoginzers()),
          getFlatButton(Text("屏幕任意位置拖动"), DragSmaple),
          getFlatButton(Text("双指缩放"), ScaleUpdate()),
          Text("原始事件处理Listene它监听可以构造手势的事件，例如当指针被按下、移动、释放或取消时"),
          getFlatButton(Text("Listener-Pointer"), PointEvenet()),
        ],
      ),
    );
  }
}
