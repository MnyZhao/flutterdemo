import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
//TextField 输入框
class MTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextField(
          onEditingComplete: (){
            print("onEditingComplete");
          },
          onSubmitted: (value) {
            print(value);
          },
          textInputAction: TextInputAction.search,
          autofocus: true,
          //自动获取焦点
          cursorColor: Colors.lightGreen,
          //光标颜色
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
        ),
        TextField(
          onEditingComplete: (){
            print("onEditingComplete");
          },
          onSubmitted: (value) {
            print(value);
          },
          textInputAction: TextInputAction.search,
          cursorColor: Colors.lightGreen,
          obscureText: true,
          //隐藏正在编辑的文本
          decoration: InputDecoration(
              labelText: "密码",
              hintText: '输入登陆密码',
              prefixIcon: Icon(Icons.lock)),
        )
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: new BaseAppBar(titleMsg: 'Input').getAppBar(),
      body: MTextField(),
    ),
  ));
}
