import 'package:flutter/material.dart';

/**
 * t图片放大实例 通过addlistener 和 setstate更新
 */
class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaleAnimationRouteState();
  }
}

////需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 3 * 1000), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变成300  需要一个
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          print("动画开始");
        } else if (status == AnimationStatus.completed) {
          print("动画结束");
//          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          print("动画消失");
//          controller.forward();
        }
      });
    ;
    //启动动画
    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Image.asset(
            'images/sea.jpg',
            width: animation.value,
            height: animation.value,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(animation.value.toInt().toString()),
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: RaisedButton(
            onPressed: () {
              controller.forward(from: 0.0);
            },
            child: Text('Click play animation'),
          ),
        )
      ],
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('基础补间动画'),
      ),
      body: ScaleAnimationRoute(),
    ),
  ));
}
