import 'package:flutter/material.dart';

import '../../../utils.dart';
import 'page_animation.dart';
import 'page_banner.dart';
import 'page_custom.dart';
import 'page_view_sample.dart';
import 'paget_builder.dart';

class pagelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("PageView示例"),
      body: ListView(
        children: <Widget>[
          getFlatButton(Text("默认构造创建"), pageview()),
          getFlatButton(Text("builder命名构造"), buidler()),
          getFlatButton(Text("custom命名构造"), cunstom),
          getFlatButton(Text("加切换动画"), pageanimation),
          getFlatButton(Text("banner"), banners),
        ],
      ),
    );
  }
}
