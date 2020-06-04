import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class buidler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("Builder"),
      body: pagerBuilder(),
    );
  }
}

class pagerBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageBuilderState();
  }
}

class PageBuilderState extends State<pagerBuilder> {
  List<String> _list = ["welcome", "hello", "Exit"];
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // viewportFraction 设置占屏幕百分之90
    _controller = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 通过pagerviewbuilder
    return PageView.builder(
        onPageChanged: (pageNum) {
          print("当前第 $pageNum 页");
        },
        // 页卡数量
        itemCount: _list.length,
        // 控制器 可以控制显示页数 此处不体现
        controller: _controller,
        itemBuilder: (context, pageNum) {
          // 页卡
          return itemBuilder(_list[pageNum], pageNum);
        });
  }
}

class itemBuilder extends StatefulWidget {
  var msg;
  var pageNum;

  itemBuilder(var msg, var pageNum) {
    this.pageNum = pageNum;
    this.msg = msg;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return itemState();
  }
}

class itemState extends State<itemBuilder> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      //创建具有对称垂直和水平偏移的插入。
      // 上下边距16 左右边距8
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('images/place_holder_2.jpg', fit: BoxFit.cover),
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: Text(
              "Page ${widget.pageNum} \n ${widget.msg}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

main() => runApp(MaterialApp(
      title: "builder",
      theme: ThemeData(accentColor: Colors.red),
      home: pagerBuilder(),
    ));
