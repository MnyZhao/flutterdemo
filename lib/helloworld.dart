import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
//  return runApp(MyRun());
  return runApp(new Center(
      child: new Text('HelloWorld',textDirection: TextDirection.ltr,
  )));
}

class MyRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "welcome",
      home: Scaffold(),
    );
  }
}
