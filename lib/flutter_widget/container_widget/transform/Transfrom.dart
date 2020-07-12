import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'dart:math' as math;

/*
 Transform可以在其子Widget绘制时对其应用一个矩阵变换（transformation），
 Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作。
 倾斜
*/
class Transfroms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform(
      alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
      transform: Matrix4.skewY(-0.3), //沿Y轴倾斜0.3弧度
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.deepOrange,
        child: const Text('Apartment for rent!'),
      ),
    );
  }
}

/*
  平移
  Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子widget平移指定的距离。
 */
class Translate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.translate(
        offset: Offset(-20.0, -5.0),
        child: Text("Hello world"),
      ),
    );
  }
}

/*
  旋转
 Transform.rotate可以对子widget进行旋转变换
 */
class TransRote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightGreenAccent),
      child: Transform.rotate(
        angle: math.pi / 2,
        child: Text('TransRote 旋转'),
      ),
    );
  }
}

/*
  缩放
  Transform.scale可以对子Widget进行缩小或放大
 */
class scale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.cyanAccent),
      child: Transform.scale(
          scale: 1.5, //放大到1.5倍
          child: Text("缩放")),
    );
  }
}

/*
  Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，
  所以无论对子widget应用何种变化，
  其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
  所以会出现紧挨着的情况 因为大小是 底色布局大小
 */
class TransShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center, //横轴居中
            crossAxisAlignment: WrapCrossAlignment.center, //纵轴居中
            children: <Widget>[
              Transfroms(),
              Translate(), //平移
              TransRote(), //旋转
              scale(), //缩放
            ],
          ),
          RoateBoxs(),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: new BaseAppBar(titleMsg: 'Transfrom变换').getAppBar(),
      body: TransShow(),
    ),
  ));
}

/**
 *  旋转  区别是在layout 阶段
 *  RotatedBox和Transform.rotate功能相似，它们都可以对子widget进行旋转变换，
 *  但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小。
 */
class RoateBoxs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }
}
