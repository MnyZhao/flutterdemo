import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/animation/navigto_animation/nav_animation_page2.dart';

class NavAnimationPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('界面间过度动画'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return NavAnimationPage2();
            }));
          },
          child: new Text("点我跳转2"),
          color: Colors.blue,
          highlightColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
