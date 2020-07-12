import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav_animation_page1.dart';

class NavAnimationPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('界面之间过度动画'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('GO'),
            onPressed: () {
              //左右切换风格CupertinoPageRoute 上下切换风格MaterialPageRoute
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return NavAnimationPage1(); //路由B
              }));
            }),
      ),
    );
  }
}

