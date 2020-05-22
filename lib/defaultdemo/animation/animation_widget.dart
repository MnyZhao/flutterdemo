import 'package:flutter/material.dart';

/**
 *
 * 区分[scale_image.dart]
 * AnimatedWidget类封装了调用setState()的细节，并允许我们将Widget分离出来，
 */
class AnimatedImages extends AnimatedWidget {
  AnimationController controller;

//  AnimatedImages({Key key, Animation<double> animation, this.controller})
//      : super(key: key, listenable: animation);
//
  AnimatedImages(
      {Key key, Animation<double> animation, AnimationController controller})
      : super(key: key, listenable: animation) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
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
        ),
      ],
    ));
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
