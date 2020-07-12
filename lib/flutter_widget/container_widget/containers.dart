import "package:flutter/material.dart";
import 'package:flutterdemo/utils.dart';

/**
 * Container 容器 可以指定大小以及子Widget的位置
 * 容器 没有子widget 尺寸默认最大
 * 不设置大小存在子widget尺寸则为子widget大小
 * 当子widget 超过容器指定大小 容器会自动包裹子widget
 */
class ContainerSmaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("容器Container"),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          // 设置子控件对齐方式
          alignment: Alignment.center,
          child: Text("123"),
//color 在源码中也是转换成decoration设置的 用了decoration color 设置无效
//        color: Colors.red,
          // BoxDecoration 容器的装饰 设置边框颜色 圆角 阴影等
          decoration: BoxDecoration(
              color: Colors.red,
              // 边框
              border: Border.all(
                  color: Colors.green, width: 5.0, style: BorderStyle.solid),
//          borderRadius: BorderRadius.all(Radius.circular(5.0))
              //圆角
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  topRight: Radius.circular(6.0)),
              // 设置阴影
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
        ),
      ),
    );
  }
}

main() => runApp(MaterialApp(
      home: ContainerSmaple(),
    ));
