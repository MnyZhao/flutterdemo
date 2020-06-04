import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'package:flutterdemo/utils.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        /**
         * RaisedButton
            RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
         */
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () => print('RaisedButton'),
        ),
        /**
         * FlatButton
            FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色：
         */
        FlatButton(
          child: Text("FlatButton"),
          onPressed: () => print('FlatButton'),
        ),
        /**
         * OutlineButton
         * OutlineButton默认有一个边框，不带阴影且背景透明。
         * 按下后，边框颜色会变亮、同时出现背景和阴影(较弱)：
         */
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () => print('OutlineButton'),
        ),
        /**
         * IconButton
         * IconButton是一个可点击的Icon，
         * 不包括文字，默认没有背景，点击后会出现背景：
         */
        Text('iconButton'),
        IconButton(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.redAccent,
          ),
          onPressed: () => print('IconButton'),
        ),
        Text('自定义按钮的外观'),
        /**
         * const FlatButton({
            ...
            @required this.onPressed, //按钮点击回调
            this.textColor, //按钮文字颜色
            this.disabledTextColor, //按钮禁用时的文字颜色
            this.color, //按钮背景颜色
            this.disabledColor,//按钮禁用时的背景颜色
            this.highlightColor, //按钮按下时的背景颜色
            this.splashColor, //点击时，水波动画中水波的颜色
            this.colorBrightness,//按钮主题，默认是浅色主题
            this.padding, //按钮的填充
            this.shape, //外形
            @required this.child, //按钮的内容
            })
         */
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () => {},
        ),
      ],
    );
  }
}

class ShowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("Button展示"),
      body: Button(),
    );
  }
}
