import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Item')),
      body: ItemWidget(),
    ),
  ));
}

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Container(
            child: InkWell(
      //点击扩散半径
      radius: 1000,
      //item 高亮颜色
      highlightColor: Colors.greenAccent,
      //点击扩散颜色
      splashColor: Colors.amber,

      onTap: () {
        print('click');
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.android),
          ),
          Center(
            child: Text("android"),
          )
//          Text('android')
        ],
      ),
    )));
  }
}
