import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  Page2({@required this.textMsg});

  String textMsg;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page2"),
      ),
      body: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "$textMsg",
            style: new TextStyle(fontSize: 25.0),
          ),
          RaisedButton(
            child: Text('点击返回page1'),
            onPressed: () {
              //用来管理出栈 返回上一个界面 若存在Dialog、BottomSheet、popMenu
              // 类似的Widget使用pop（）方法会优先进行这些Widget的关闭操作
              Navigator.of(context).pop();
            },
          )
        ],
      )),
    );
  }
}
