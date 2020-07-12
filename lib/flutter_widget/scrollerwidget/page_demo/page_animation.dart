import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class pageAnimation extends StatefulWidget {
  List<String> list = [
    'images/leak.jpg',
    'images/place_holder_2.jpg',
    'images/sea.jpg'
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return pageAnimationStaet();
  }
}

class pageAnimationStaet extends State<pageAnimation> {
  PageController _controller = PageController();
  var _currentPageValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      setState(() {
        //在PageController中可以得到滚动 position,当前 page 等信息，
        // 其中当前page不是int，而是double，是例如从1滚动到2的时候，会返回中间值，会变化，
        // 所以添加以此添加滚动消失动画。
        _currentPageValue = _controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int num) {
        return Transform(// 通过transForm 实现动画
            transform: Matrix4.identity()..rotateX(_currentPageValue - num),
            child: SizedBox(
              width: 400,
              height: 400,
              child: Image.asset(widget.list[num]),
            ));
      },
      controller: _controller,
    );
  }
}

Widget pageanimation=Scaffold(
        appBar: getAppBar("animation"),
        body: pageAnimation(),
      );
