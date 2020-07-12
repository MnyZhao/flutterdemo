
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'implicitly_animated/ImplicitlySample.dart';
import 'tween/ScaleAnimation.dart';
import 'tween/animation_builder.dart';
import 'tween/animation_widget.dart';

class AnimationSample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("动画示例 "),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("具体动画描述看reademe，或者代码中有详细注释"),
          Text("缩放动画-通过基础方式 Animation controller tween curve"),
          getFlatButton(Text("缩放动画"),ScaleAnimation),
          Text("缩放动画-通过AnimatedWidget"),
          getFlatButton(Text("通过AnimatedWidget"),AnimatedWidgets),
          Text("缩放动画-通过AnimatedBuilder"),
          getFlatButton(Text("通过AnimatedBuilder"),AnimatedBuiders),
          Text("缩放动画-通过隐式动画"),
          getFlatButton(Text("通过隐式动画"),Impli()),
        ],
      ),
    );
  }

}