import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'DecorationBox.dart';
import 'SizeBox.dart';
import 'clip/clip.dart';
import 'clip/customcliper.dart';
import 'containers.dart';
import 'padding.dart';
import 'transform/transformSample.dart';

class ContainerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("容器类组件"),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          getFlatButton(Text("Padding"), paddingSample()),
          getFlatButton(Text("Container"), ContainerSmaple()),
          Text("受约束的盒子和约束规则以及指定大小的盒子"),
          getFlatButton(Text("ConstrainedBoxSmaple"), ContainerSmaple()),
          getFlatButton(Text("SizeBox"), SizeBoxSmaple()),
          getFlatButton(Text("装饰盒子DecorationBox"), DecorationBoxSmaple),
          Text(
              "Transform(变换)可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作"),
          getFlatButton(Text("Transform"), TransFormSample()),
          getFlatButton(Text("Clip裁剪widget"), ClipTestRoute()),
          Text("如果我们只想截取图片中部40×30像素"),
          getFlatButton(Text("CustomClipper自定义裁剪区域"), ClipperSample()),
        ],
      ),
    );
  }
}
