import 'package:flutter/material.dart';

import '../../utils.dart';

///用于给子widget指定固定的宽高
///实际上SizedBox和只是ConstrainedBox一个定制 并没有什么差异
///[SizeBox] 中的代码等价于[ConstrainedBoxs]中的代码
class SizeBoxs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 80,
      height: 80,
      child: redBox,
    );
  }
}

///
class ConstrainedBoxs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
      child: redBox,
    );
  }
}

Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

class SizeBoxSmaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("SizeBox"),
      body: Column(
        children: [
          Text("SizeBox"),
          SizeBoxs(),
          Text("实际上SizedBox和只是ConstrainedBox一个定制 二者并没有什么差异"),
          Spacer(
            flex: 1,
          ),
          Text("ConstrainedBoxs"),
          ConstrainedBoxs(),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
