

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new TimeLinePage(),
  ));
}

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  AppBar appBar;
  ScrollController controller = ScrollController();
  String title = "test";

  @override
  void initState() {
// TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
      elevation: 0,
      title: Text(title),
      backgroundColor: Colors.black54,
    );
    print(
        "${MediaQuery.of(context).size.height} : ${appBar.preferredSize.height} : ${MediaQuery.of(context).padding.top} : ${appBar.backgroundColor}");
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              child: Text("dfd"),
            ),
            GridView.custom(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 13.0,
                ),
                childrenDelegate: new SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildTimeLine("踢足球", index: index);
                  },
                  childCount: 20,
                )),
//            ListView(
//              shrinkWrap: true,
//              controller: controller,
//              children: <Widget>[
//                Stack(
//                  children: <Widget>[
//                    Image.asset(
//                      "imgs/hold_sfz.png",
//                      height: (MediaQuery
//                          .of(context)
//                          .size
//                          .height -
//                          appBar.preferredSize.height) /
//                          4,
//                      width: double.infinity,
//                      fit: BoxFit.fill,
//                    ),
//                    Positioned(
//                      right: 0,
//                      bottom: 0,
//                      child: Text("右下角"),
//                    )
//                  ],
//                ),
//                ListView.builder(
//                  itemCount: 16,
//                  shrinkWrap: true,
//                  itemBuilder: (context, i) {
//                    return _buildTimeLine("踢足球", index: i);
//                  },
//                ),
//              ],
//            ),
          ],
        ),
      ),
    );
  }

  /// handle new date selected event
  void handleNewDate(date) {}

  Widget _buildTimeLine(String message, {int index = 0}) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Card(
            margin: EdgeInsets.all(index == 2 ? 60 : 20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(message),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          bottom: 0.0,
          child: Container(
            margin: EdgeInsets.only(left: 35),
            width: 2.0,
            color: Colors.blue,
          ),
        ),
        Positioned(
          top: 13.0,
          left: 22.5,
          child: Container(
            height: 26.0,
            width: 26.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightGreen,
            ),
            child: Container(
              margin: EdgeInsets.all(3.0),
              height: 26.0,
              width: 26.0,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),
        )
      ],
    );
  }
}
