import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

Widget inkwellSmaple = Scaffold(
  appBar: getAppBar('InkWell点击 水波纹'),
  body: ItemWidget(),
);

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        child: InkWell(
          ///点击扩散半径
          radius: 1000,
          //item 高亮颜色
          highlightColor: Colors.greenAccent,
          //点击扩散颜色
          splashColor: Colors.amber,
          onTap: () {
            print('click');
          },
          child: Center(
            child: Text("android"),
          ),
        ),
      ),
    );
  }
}
