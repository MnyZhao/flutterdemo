import 'package:flutter/material.dart';

import '../../../utils.dart';

class GridViewDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar('GridViewDefaule'),
      body: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 1.0 //宽高比为1时，子widget
              ),
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {},
            ),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ]),
    );
  }
}

void main() {
  runApp(MaterialApp(
//    home: MGridView(),
    home: GridViewDefault(),
  ));
}
