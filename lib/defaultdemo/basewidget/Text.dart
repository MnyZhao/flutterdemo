import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

/**
 * 文字和字体样式
 */
class MText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          "Hello world",
          textAlign: TextAlign.center, //文本对齐方式
        ),
        Text(
          "Hello world! I'm Jack. " * 4, //重复4次
          maxLines: 1, //最大行数
          overflow: TextOverflow.ellipsis, //通过overflow指定阶段方式 此处多余文本显示省略号
        ),
        Text(
          "Hello world",
          textScaleFactor: 1.5,
          //textScaleFactor
          //代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize
          //它是调整字体大小的一个快捷方式。
          // 该属性的默认值可以通过MediaQueryData.textScaleFactor获得
        ),
        Text(
          "Hello world",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: new Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed),
        ),
      ],
    );
  }
}

void main() {
  String s=(true?'12':'34');
  runApp(new MaterialApp(
    home: Scaffold(
      appBar: new BaseAppBar(titleMsg: 'Text$s').getAppBar(),
      body: MText(),
    ),
  ));
}
