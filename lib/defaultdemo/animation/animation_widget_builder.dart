import 'package:flutter/material.dart';

/**
 * AnimationBuilder 继承自AnimationWidget 它将显示部分和动画部分分离 方便给特定的view
 * 添加具体的动画
 *
 */
class AnimatedImages extends AnimatedWidget {
  AnimationController controller;

  AnimatedImages({Key key, Animation<double> animation, this.controller})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    // TODO: implement build
    return AnimatedBuilder(
        animation: animation,
        child: Image.asset(
          'images/sea.jpg',
        ),
        builder: (BuildContext context, Widget child) {
          return new Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        });
  }
}

class ScaleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaleAnimationState();
  }
}

class ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Tween opacityAnimation;

  @override
  initState() {
    super.initState();

    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedImages(
      animation: animation,
      controller: controller,
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('AnimatedWidget'),
      ),
      body: ScaleAnimation(),
    ),
  ));
}
