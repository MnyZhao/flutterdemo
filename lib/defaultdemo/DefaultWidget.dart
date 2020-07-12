import 'package:flutter/material.dart';

// 基础组建基本用法
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 23),
      height: 56.0,
      // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => print('search'),
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
              title: Text('title', style: Theme.of(context).primaryTextTheme.title)),
          new Expanded(
            flex: 1,
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'what?',
    home: MyScaffold(),
  ));
}
