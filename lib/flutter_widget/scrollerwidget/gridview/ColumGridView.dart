import 'package:flutter/material.dart';

//void main() {
////  runApp(MaterialApp(
////    home: Scaffold(
////      appBar: AppBar(title: Text('CloumnGrid')),
////      body: MyCGs(),
////    ),
////  ));
////}
//GridView,CustomScrollView都需要指定显示范围，gridView/CustomScrollView包括在Column中无法自由指定显示范围，
//=> 解决方法：
//
//使用Expand包裹，尽可能扩大child范围，或者使用container指定宽高
//使用shrinkWrap = true属性，

class ColumnGrideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CloumnGrid')),
      body: MyCGs(),
    );
  }
}

class MyCGs extends StatelessWidget {
  List<Icon> list = [
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
    Icon(Icons.beach_access),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: null,
          color: Colors.blue,
          child: Text('Click'),
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // 设置列数 每列间距
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0),
              itemBuilder: (context, index) {
                return list[index];
              }),
        ),
      ],
    );
  }
}
