import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/flutter_widget/layoutwidget/stack.dart';
import 'package:flutterdemo/utils.dart';

import 'Flex.dart';
import 'WrapFlow.dart';
import 'alignSample.dart';
import 'rowcolum.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("layout"),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          getFlatButton(Text("flex弹性布局可设置权重"), Flexss()),
          getFlatButton(Text("线性布局row column"), RowColumn()),
          Text("Positioned 设置组件绝对位置"),
          getFlatButton(Text(" 层叠布局 Stack、Positioned"), Stacks()),
          getFlatButton(Text("流式布局"), WrapFlows()),
          getFlatButton(Text("对齐与相对定位（Align）"), AlignSample()),
        ],
      ),
    );
  }
}
