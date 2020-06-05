import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

/**
 * Scrollbar 表示当前滚到什么位置即滚动时侧边的滚动条
 * SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子Widget。
 */
class MSingleChildGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    // TODO: implement build
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MSingleChildGridView(),
    ),
  ));
}
Widget SingleChildScrollAndScrollbar=Scaffold(
  appBar: getAppBar("滚动布局和滚动条"),
);