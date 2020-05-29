/*
 dart 中输入框是 TextFiled 相当于Edittext
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Input());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Input",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Input"),
        ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputState();
  }
}

class InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
