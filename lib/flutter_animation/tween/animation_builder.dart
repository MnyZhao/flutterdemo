import 'package:flutter/material.dart';

/**
 * AnimationBuilder 继承自AnimationWidget
 * 是拆分动画的一个工具类，借助它我们可以将动画和widget进行分离
 * 在[ScaleAnimationWidget.dart] 更改动画需要更改显示logo的widget。更好的解决方案是将职责分离：
    + 显示Logo
    + 定义Animation对象
    + 渲染过渡效果
    可以借助AnimatedBuilder类完成此分离。AnimatedBuilder是渲染树中的一个独立的类。
    与AnimatedWidget类似，AnimatedBuilder自动监听来自Animation对象的通知因此不需要手动调用addListener()。
 *
 * 使用AnimatedBuilder将动画描述为另一个widget的build方法的一部分。
 * 如果你只是想创建一个可复用的动画widget，请使用AnimatedWidget。
 * Flutter API中AnimatedBuilder的示例包括: BottomSheet、ExpansionTile、 PopupMenu、ProgressIndicator、RefreshIndicator、Scaffold、SnackBar、TabBar、TextField
 */
// 先定义显示image的widget
class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

/*
 GrowTransition的build()方法完成了对widget的动画设置
 GrowTransition本身是无状态的，并拥有定义过渡动画所需的最终变量集合。
 build()函数创建并返回AnimatedBuilder，它将（匿名构建器）方法和LogoWidget对象作为参数。
 渲染转换的工作实际上发生在（匿名构建器）方法中， 该方法创建一个适当大小的Container来强制缩放LogoWidget。

下面的代码中有一个的问迷惑的题是，child看起来像被指定了两次。
但实际发生的事情是，将外部引用child传递给AnimatedBuilder，AnimatedBuilder将其传递给匿名构造器，
然后将该对象用作其子对象。最终的结果是AnimatedBuilder插入到渲染树中的两个widget之间。
*/
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget child) {
          return new Container(
              height: animation.value, width: animation.value, child: child);
        },
      ),
    );
  }
}

class LogoAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogoAnimationState();
  }
}

class LogoAnimationState extends State<LogoAnimation>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    super.initState();

    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //Container宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GrowTransition(child: new LogoWidget(), animation: animation);
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

Widget AnimatedBuiders = Scaffold(
  appBar: AppBar(
    title: Text('AnimatedWidgetBuilder'),
  ),
  body: LogoAnimation(),
);
