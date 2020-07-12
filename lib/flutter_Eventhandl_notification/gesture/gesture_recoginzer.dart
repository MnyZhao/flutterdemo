import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

/**
 * GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，
 * 而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，
 * GestureDetector直接可以接收一个子Widget。GestureRecognizer是一个抽象类，
 * 一种手势的识别器对应一个GestureRecognizer的子类，Flutter实现了丰富的手势
 * 识别器，我们可以直接使用。
 */
/**
 * 假设我们要给一段富文本（RichText）的不同部分分别添加点击事件处理器，
 * 但是TextSpan并不是一个Widget，这时我们不能用GestureDetector，
 * 但TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer，
 * 假设我们在点击时给文本变色:
 */
class Recoginzers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecoginzerState();
  }
}

class RecoginzerState extends State<Recoginzers> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar('手势识别器-给部分文字换色'),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "你好世界"),
          TextSpan(
              text: '点我变色',
              style: TextStyle(
                  fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = (!_toggle);
                  });
                }),
          TextSpan(text: '。。。。。')
        ])),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Recoginzers(),
  ));
}
