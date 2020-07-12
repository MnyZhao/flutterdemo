import 'package:flutter/material.dart';

/**
 *
 * 区分[ScaleAnimationWidget.dart]
 * 和animate1中不同的是，AnimatedWidget(基类)中会自动调用addListener()和setState()。
 * 也就是AnimatedWidget类封装了调用setState()的细节
 */
// 首先继承AnimationWidget 而不是StatefulWidget
class AnimatedLogo extends AnimatedWidget {
  AnimationController controller;

  //listenable 是当前小部件正在监听的 通常是animation 或者 ChangeNotifier
  //用于监听该动画，然后通知更新UI 就无需手动调用addListener监听动画然后调用setState更新UI
  AnimatedLogo({Key key, Animation<double> animation, this.controller})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    // TODO: implement build
    return Center(
      child: Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class ScaleAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaleAnimationWidgetState();
  }
}

class ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
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
    return AnimatedLogo(
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

Widget AnimatedWidgets=Scaffold(
      appBar: AppBar(
        title: Text('AnimatedWidget'),
      ),
      body: ScaleAnimationWidget(),
    );
