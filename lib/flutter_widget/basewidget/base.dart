import 'package:flutter/material.dart';
import 'package:flutterdemo/flutter_widget/basewidget/StateTestA.dart';
import 'package:flutterdemo/flutter_widget/container_widget/containersample.dart';
import 'package:flutterdemo/utils.dart';
import 'TextFiledSample/search.dart';

import 'ImageAndIcon.dart';
import 'SwitchAndCheckBox.dart';
import 'Text.dart';
import 'TextFiledSample/TextFieldShow.dart';
import 'button.dart';
import 'card/CardView.dart';
import 'card/news.dart';

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("基础组件"),
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30),
        children: [
          Text("State生命周期"),
          getFlatButton(Text("State生命周期"), StateSample()),
          Text("text"),
          getFlatButton(Text("text"), MText()),
          Text("输入框"),
          getFlatButton(Text("TextField(输入)"), TextFieldShow()),
          getFlatButton(Text("TextField-搜索框"), SearchSmaple),
          Text("按钮"),
          getFlatButton(Text("Button"), ShowButton()),
          Text("图片控件"),
          getFlatButton(Text("ImageAndIcon"), ImageAndIconWidget()),
          Text("选择控件"),
          getFlatButton(Text("SwitchAndCheckBox"), SwitchAndCheckBox()),
          Text("卡片"),
          getFlatButton(Text("Card"), CardView()),
          getFlatButton(Text("material实现"), Item),
        ],
      ),
    );
  }
}
