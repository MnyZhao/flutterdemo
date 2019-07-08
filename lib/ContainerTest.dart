import 'package:flutter/material.dart';

Container container = Container(
  color: Colors.purpleAccent,
  width: 300.0,
  height: 400.0,
  margin: EdgeInsets.all(15.0),
  child: Column(
    children: <Widget>[
      Text("hello"),
      Text("hello1"),
      Text("hello2"),
      Text("hello3"),
      Text("hello4"),
    ],
  ),
);

class helloRectangle extends StatelessWidget {
  String hello;

  helloRectangle(@required String hello) {
    this.hello = hello;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            width: 300.0,
            height: 400.0,
            color: Colors.greenAccent,
            child: Center(
              child: Text(
                this.hello,
                style: TextStyle(fontSize: 40.0, color: Colors.amber),
              ),
            )
//
            ));
  }
}

void main() {
  runApp(MaterialApp(
    //去掉右上角的debug标记
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Hello rectangle'),
      ),
      body: helloRectangle('Hello rectangle'),
//      body: DefaultWidget(),
    ),
  ));
}

/**
 * 基础组建
 */
class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Material(
      child: Container(
//        color: Colors.lightBlueAccent,  color 在源码中也是转换成decoration设置的 所以代码里不能同时包含color 和decoration
        margin: EdgeInsets.all(10.0),
        height: 56.0,
        // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //decoration 可以设置边框 颜色 圆角等
        decoration: BoxDecoration(
            color: Colors.blue[500],
            border: Border.all(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu', //长按显示内容
              onPressed: null, // null 会禁用 button
            ),
            IconButton(
                icon: Icon(Icons.menu, color: Colors.lightBlueAccent),
                tooltip: 'Navigation menu', //长按显示内容
                onPressed: () {
                  print('color click');
                } //null 禁用button
                ),
            Expanded(
              child: Title(color: null, child: null),
            )
          ],
        ),
      ),
    );
  }
}
