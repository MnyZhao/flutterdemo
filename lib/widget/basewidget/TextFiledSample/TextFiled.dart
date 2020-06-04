/*
 dart 中输入框是 TextFiled 相当于Edittext
 动态展示 当用户输入错误展示error
 显示右下角的输入长度
 通过onchangge 或者 controller 来获取文本内容
 下面有详细展示 代码配合部分文本描述

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputState();
  }
}

class InputState extends State<Input> {
  var _cotroller = TextEditingController();
  var _cotrollerPwd = TextEditingController();
  var _err;
  var _errPwd;
  var _count = "";
  var _countPwd = "";
  final maxLength = 11;
  final maxLengthPwd = 6;

  // 焦点
  FocusNode focusNodeUser = FocusNode();
  FocusNode focusNodePwd = FocusNode();

  // 是否密码框
  bool _isPwd = true;

  // 密码框明文密文图标
  IconData _icon = Icons.panorama_fish_eye;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count = "0 / $maxLength";
    _countPwd = "0 / $maxLengthPwd";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cotroller.dispose();
    _cotrollerPwd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Input"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              focusNode: focusNodeUser,
              // 设置键盘输入
              keyboardType: TextInputType.number,
              // 输入框控制器 可获取输入框文本
              controller: _cotroller,
              // 监听文本变化
              onChanged: onChange,
              // 监听键盘点击完成或者提交或者回车键
              onSubmitted: onSubmit,
              // 监听键盘点击完成或者提交或者回车键 与submit的区别就是不带返回值
              // 不建议与onSubmitted 一起使用
              //onEditingComplete: onEditingComplete,
              maxLength: maxLength,
              maxLines: 1,
              maxLengthEnforced: true,
              // 输入框装饰
              decoration: InputDecoration(
                labelText: "用户名",
                helperText: "请输入手机号",
                prefixIcon: Icon(Icons.person),
                errorText: _err,
                counterText: _count,
              ),
            ),
            TextField(
              // 设置为密码
              obscureText: _isPwd,
              keyboardType: TextInputType.number,
              // 设置焦点
              focusNode: focusNodePwd,
              // 输入框控制器 可获取输入框文本
              controller: _cotrollerPwd,
              maxLength: maxLengthPwd,
              maxLines: 1,
              maxLengthEnforced: true,
              onChanged: (value) {
                setState(() {
                  _countPwd = "${value.length} / $maxLengthPwd";
                  _errPwd = null;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  if (value.length != 6) {
                    _errPwd = "请输入正确六位密码";
                  }
                });
              },
              // 输入框装饰
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  // 通过suffixIcon 设置小眼睛图标
                  padding: EdgeInsets.only(bottom: 0.0),
                  icon: Icon(
                    _icon,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isPwd) {
                        _isPwd = false;
                        _icon = Icons.remove_red_eye;
                      } else {
                        _isPwd = true;
                        _icon = Icons.panorama_fish_eye;
                      }
                    });
                  },
                ),
                labelText: "密码",
                helperText: "请输入六位密码",
                prefixIcon: Icon(Icons.lock),
                counterText: _countPwd,
                errorText: _errPwd,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: button(context, _cotroller, _cotrollerPwd),
            )
          ],
        ),
      ),
    );
  }

  void onChange(String s) {
    setState(() {
      _err = null;
      _count = "${s.length} / $maxLength";
    });
  }

  void onSubmit(String s) {
    setState(() {
      _err = checkPhone(_cotroller.text);
      // 点击完成焦点切换
      FocusScope.of(context).requestFocus(focusNodePwd);
    });
  }

  void onEditingComplete() {
    setState(() {
      _err = checkPhone(_cotroller.text);
    });
  }

  /**
   * 检测手机号码
   */
  String checkPhone(String phoneNumber) {
    if (phoneNumber.length < 11) {
      return "请输入正确手机号";
    }
    return null;
  }

  Widget button(BuildContext context, TextEditingController user, pwd) {
    String loginMsg;
    return FlatButton(
        color: Colors.blue,
        highlightColor: Colors.blue[700],
        colorBrightness: Brightness.dark,
        splashColor: Colors.grey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {
          var username = user.text;
          var pwds = pwd.text;
          setState(() {
            if (username.length != 11) {
              _err = "请输入正确手机号";
              loginMsg = "输入信息错误请重新输入";
            }
            if (pwds.length != 6) {
              _errPwd = "请输入正确六位密码";
              loginMsg = "输入信息错误请重新输入";
            }
            if (username.length == 11 && pwds.length == 6) {
              loginMsg = "$username Login Success";
            }
          });
          showDialog(
              context: context,
              child: AlertDialog(
                  title: Text("Login"),
                  content: Text(loginMsg),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.of(context).pop(true),
                    )
                  ]));
        },
        child: Text("Login"));
  }
}
