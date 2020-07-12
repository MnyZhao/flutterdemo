import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class ClickSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CLickSmapleState();
  }
}

class CLickSmapleState extends State<ClickSample> {
  var _msg = "msg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: getAppBar("Click"),
        body: Center(
          child: Wrap( // listView 设置Container宽度无效
            direction: Axis.vertical,
            children: [
              Text("$_msg"),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _msg = "GestureDetector";
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.red,
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    child: Text("Click-GestureDetector")),
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    child: Text("Click-InkWell")),
                onTap: () {
                  setState(() {
                    _msg = "InkWell";
                  });
                },
              ),
              FlatButton(
                color: Colors.amberAccent,
                child: Text("flatbutton"),
                onPressed: () {
                  setState(() {
                    _msg = "FlatButton";
                  });
                },
              )
            ],
          ),
        ));
  }
}
