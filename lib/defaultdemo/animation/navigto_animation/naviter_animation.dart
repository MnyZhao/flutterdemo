import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/animation/navigto_animation/nav_animation_design_page3.dart';
import 'package:flutterdemo/defaultdemo/animation/navigto_animation/nav_animation_page1.dart';

class NaviterAniamtion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('界面之间过度动画'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('GO'),
                onPressed: () {
                  //左右切换风格CupertinoPageRoute 上下切换风格MaterialPageRoute
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return NavAnimationPage1(); //路由B
                  }));
                }),
            RaisedButton(
                child: Text('GO3'),
                onPressed: () {
                  //左右切换 自定义从左到右
                  Navigator.push(
                      context,
                      _getRoute(
                          Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)));
                }),
          ],
        ),
//        child: RaisedButton(
//            child: Text('GO'),
//            onPressed: () {
//              //左右切换风格CupertinoPageRoute 上下切换风格MaterialPageRoute
//              Navigator.push(context, CupertinoPageRoute(builder: (context) {
//                return NavAnimationPage1(); //路由B
//              }));
//            }),
      ),
    );
  }
}

Route _getRoute(Tween<Offset> tween) {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 2),
    pageBuilder: (context, animation, secondaryAnimation) =>
        NavAnimationPage3(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(tween.chain(CurveTween(curve: Curves.ease))),
        child: child,
      );
    },
  );
}

void main() {
  runApp(MaterialApp(
    home: NaviterAniamtion(),
  ));
}
