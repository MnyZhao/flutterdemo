import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

/**
 * 受约束的盒子 和 有大小的盒子
 */
class ConstrainedBoxSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50.0,
        minWidth: double.infinity,
      ),
      child: Container(
        height: 50.0,
        child: redBox,
      ),
    );
  }
}

Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

//多重限制
//有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。
// 实际上，只有这样才能保证父限制与子限制不冲突。
class ConsstainedBoxSome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
          child: redBox,
        ));
  }
}

//UnconstrainedBox
//UnconstrainedBox不会对子Widget产生任何限制，它允许其子Widget按照其本身大小绘制。
class UnconstrainedBoxs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
        child: UnconstrainedBox(
          //“去除”父级限制
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
            child: redBox,
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: new BaseAppBar(titleMsg: 'ConstrainedBoxSizeBox').getAppBar(),
        body: Column(
          children: <Widget>[
            ConstrainedBoxSizeBox(),
            ConsstainedBoxSome(),
            UnconstrainedBoxs(),
          ],
        )),
  ));
}
