import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

/*缩放动画*/

class ScaleLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createStateshi
    return ScaleLogoState();
  }
}

class ScaleLogoState extends State<ScaleLogo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;

//  定义AnimationController时，必须传入一个vsync对象
  // 使用vsync需要混入TickerProvider
  // SingleTickerProviderStateMixin 是flutter提供的
  // 官方描述：要在仅使用单个[AnimationController]的[State]中创建[AnimationController]，
  // 请混合使用此类，然后将`vsync：this` ///传递给动画控制器构造函数
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3 * 1000));
    //使用弹性曲线
    animation = CurvedAnimation(
        curve: Curves.easeIn, reverseCurve: Curves.easeOut, parent: controller);
    // 从0放大到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      // 添加监听事件
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      })
      //使用addStatusListener来处理动画状态更改的通知，例如启动、停止或反转方向。
      //当动画完成或返回其开始状态时，通过反转方向来无限循环运行动画
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          print("动画开始");
        } else if (status == AnimationStatus.completed) {
          print("动画结束");
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          print("动画消失");
          // controller.forward();
        }
      });
    ;
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            width: animation.value,
            height: animation.value,
            child: FlutterLogo()),
        Text(animation.value.toInt().toString()),
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

Widget ScaleAnimation = Scaffold(
  appBar: getAppBar("缩放动画"),
  body: ScaleLogo(),
);
