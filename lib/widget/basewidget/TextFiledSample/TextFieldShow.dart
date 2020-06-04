import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';
import 'Input.dart';
import 'InputGet.dart';
import 'TextFiled.dart';

class TextFieldShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("输入框展示"),
      body: ListView(
        padding: EdgeInsets.only(left: 30, right: 30),
        children: <Widget>[
          getFlatButton(Text("Textfield基础设置"), MTextFields()),
          getFlatButton(Text("Textfield取值"), getTexts()),
          getFlatButton(Text("Textfield模拟登陆界面"), Input()),
        ],
      ),
    );
  }
}
