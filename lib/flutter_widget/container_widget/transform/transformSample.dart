import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'Transfrom.dart';

class TransFormSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("矩阵变化"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("下面操作针对子view"),
          getFlatButton(Text("倾斜"), getWidget("倾斜", Transfroms())),
          getFlatButton(Text("平移"), getWidget("平移", Translate())),
          getFlatButton(Text("旋转TransRote 不改变子view位置"), getWidget("旋转", TransRote())),
          getFlatButton(Text("旋转RoateBoxs 改变子view位置"), getWidget("旋转", RoateBoxs())),
          getFlatButton(Text("缩放"), getWidget("缩放", scale())),
        ],
      ),
    );
  }

  Widget getWidget(String titleMsg, Widget router) {
    return Scaffold(
      appBar: getAppBar(titleMsg),
      body:Center(child: router,)
    );
  }
}
