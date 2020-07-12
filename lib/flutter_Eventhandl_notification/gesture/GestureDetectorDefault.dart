import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class GestureDecetor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureDecetorState();
  }
}

class GestureDecetorState extends State<GestureDecetor> {
  String _operation = "No Gesture detected!"; //保存事件
  void updateText(String msg) {
    setState(() {
      _operation = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: getAppBar("基础手势检测 单击 双击 长按"),
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '$_operation',
                style: TextStyle(color: Colors.white),
              ),
              width: 300.0,
              height: 200.0,
              color: Colors.blue,
            ),
            onTap: () => setState(() => _operation = 'Tap 点击'), //点击
            onDoubleTap: () => updateText("DoubleTap 双击"), //双击
            onLongPress: () => updateText("LongPress 长按"), //长按
          ),
        ),
      ),
    );
  }
}

