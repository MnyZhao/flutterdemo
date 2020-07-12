import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

/*
 *  剪裁Widget
 *  ClipOval	子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
 *  ClipRRect	将子组件剪裁为圆角矩形
 *  ClipRect	剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
 *  注意
 *  最后的两个Row！它们通过Align设置widthFactor为0.5后，
 *  图片的实际宽度等于60×0.5，即原宽度一半，但此时图片溢出部分依然会显示，
 *  所以第一个“你好世界”会和图片的另一部分重合，为了剪裁掉溢出部分，
 *  我们在第二个Row中通过ClipRect将溢出部分剪裁掉了。
 */
class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset('images/avatar.jpg', width: 60.0);
    return Scaffold(
      appBar: getAppBar("Clip"),
        body: Center(
      child: Column(
        children: <Widget>[
          avatar, //不剪裁
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              Text("你好世界", style: TextStyle(color: Colors.green))
            ],
          ),
        ],
      ),
    ));
  }
}
