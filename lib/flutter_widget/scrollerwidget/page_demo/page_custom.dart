import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

Widget cunstom = Scaffold(
  appBar: getAppBar("custom"),
  body: pagetCustom(),
);

class pagetCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return cunstomState();
  }
}

class cunstomState extends State<pagetCustom> {
  List<String> _list = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        PageView.custom(
            //childrenDelegate 添加子项
            childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Center(
                    child: Text("${_list[index]}"),
                  );
                },
                childCount: _list.length,
                // 查找子项索引
                findChildIndexCallback: (Key key) {
                  final ValueKey valueKey = key;
                  final String data = valueKey.value;
                  return _list.indexOf(data);
                })),
        Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: FlatButton(
              color: Colors.amberAccent,
              child: Text("重新排序"),
              onPressed: () {
                setState(() {
                  _list = _list.reversed.toList();
                });
              },
            )),
      ],
    );
  }
}
