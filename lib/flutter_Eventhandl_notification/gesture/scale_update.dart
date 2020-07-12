import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class ScaleUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaleUpdateState();
  }
}

class ScaleUpdateState extends State<ScaleUpdate> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar('手势缩放双指张开体验效果'),
      body: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset(
          'images/sea.jpg',
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ScaleUpdate(),
  ));
}
