import 'package:flutter/material.dart';

import '../../../utils.dart';

class pageview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("pageview"),
      body: myPageDefault(),
    );
  }
}

class myPageDefault extends StatelessWidget {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      controller: _pageController,
      // 监听页面变化
      onPageChanged: (num){},
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.black,
          child: Center(
              child: Text(
            "Page1向左滑动",
            style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.red,
          child: Center(
              child: Text(
            "Page2",
            style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.blue,
          child: Center(
              child: Text(
            "Page3",
            style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }
}

main() => runApp(MaterialApp(
      title: "pageview",
      theme: ThemeData(accentColor: Colors.redAccent),
      home: pageview(),
    ));
