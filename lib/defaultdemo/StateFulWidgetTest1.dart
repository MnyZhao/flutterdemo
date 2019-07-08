import 'package:flutter/material.dart';

/**
 * 通过两个无状态控件来显示状态变化
 * 创建了两个新的无状态widget！我们清晰地分离了 显示 计数器（Show）和 更改 计数器（AddCountButton）的逻辑。
 * 尽管最终效果与前一个示例相同，但责任分离允许将复杂性逻辑封装在各个widget中，同时保持父项的简单性。
 */

/**
 * 用来展示变化的count
 */
class Show extends StatelessWidget {
  Show({
    this.count,
  });

  int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Count: $count');
  }
}

/**
 * 用来点击事件button
 */
class AddCountButton extends StatelessWidget {
  AddCountButton({this.click});

  VoidCallback click;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: click,
      child: Text('AddCountClick'),
    );
  }
}

/**
 * 改变值
 */
class AddCount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddCountStates();
  }
}

class AddCountStates extends State<AddCount> {
  int _count = 0;

  void onClickAdd() {
    setState(() {
      ++_count;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('通过传值改变无状态控件的属性'),
        ),
        body: Row(
          children: <Widget>[
            AddCountButton(click: onClickAdd),
            Show(
              count: _count,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(AddCount());
}
