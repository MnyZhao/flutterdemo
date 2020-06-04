import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/widget/layoutwidget/stack.dart';

import 'Flex.dart';
import 'WrapFlow.dart';
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
          getFlatButton(Text("行列column_row"), RowColumn()),
          getFlatButton(Text("层叠布局"), Stacks()),
          getFlatButton(Text("流式布局"), WrapFlows()),
        ],
      ),
    );
  }
}
