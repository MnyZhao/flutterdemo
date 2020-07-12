import 'package:flutter/material.dart';
import 'package:flutterdemo/flutter_widget/funcation_widget/future_stream_builder/StreamBuilderSample.dart';
import 'package:flutterdemo/utils.dart';

import 'future_stream_builder/FutureBuilderSample.dart';
import 'inheritedwidget/InheritedWidget.dart';
import 'willpopscope/WillPopScopeHome.dart';
import 'willpopscope/WillPopScopeSmaple.dart';

class FuncationSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("功能组件"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("通过WillPopScope实现二次点击退出"),
          getFlatButton(Text("WillPopScope_alertdialog"), HomePage()),
          getFlatButton(Text("WillPopScope_文字提示"), WillPopScopeTestRoute()),
          Text("数据共享inheritedwidget provider(详情看readme)"),
          getFlatButton(Text("WillPopScope_文字提示"), InheritedWidgetTestRoute()),
          Text("异步更新UI FutureBuilder（5秒接收一个数据） StreamBuilder(每三秒增加1)"),
          getFlatButton(Text("FutureBuilder"), FutureBuilderSample),
          getFlatButton(Text("StreamBuilder"), StreamBuilderSample),
        ],
      ),
    );
  }
}

main() => runApp(MaterialApp(home: FuncationSample()));