import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'ComputeIsolate',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text("ComputeIsolate")),
            body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: FlatButton(
                        onPressed: () async {
                          String s = await compute(work, 4);
                          print(s);
                        },
                        child: Text(
                          "Click",
                        )),
                  ),
                  Center(
                      child: Text(
                    "Click",
                  )),
                ])));
  }
}
String work(num duration) {
  print("work start");
  sleep(Duration(seconds: duration));
  return "$duration 秒后执行结束";
}
