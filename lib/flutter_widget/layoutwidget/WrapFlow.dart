import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'package:flutterdemo/utils.dart';

/**
 * 流式布局  wrap flow
 * Row和Colum 如果子widget超出屏幕范围 不会自动折行，则会报溢出错误
 * wrap 则会自动折行
 */
class WrapFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            new Chip( // 标签组件
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
              onDeleted: () => {},
              deleteIcon: Icon(Icons.delete_forever),
              deleteIconColor: Colors.red,
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
          ],
        ),
        MFlow(),
      ],
    );
  }
}

class MFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
class WrapFlows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new BaseAppBar(titleMsg: 'FlexExpanded').getAppBar(),
      body: WrapFlow(),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar:getAppBar('流式布局 Wrap and Flow'),
      body: WrapFlow(),
    ),
  ));
}
