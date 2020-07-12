import "package:flutter/material.dart";
import 'package:flutterdemo/utils.dart';

class BottomNav_PageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BPState();
  }
}

class BPState extends State<BottomNav_PageView> {
  List<String> _msgList = ["Home", "Office"];
  var msg;
  var _index = 0;
  List<BottomNavigationBarItem> _itemList = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_post_office), title: Text('Office'))
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("${_msgList[_index]}"),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: _itemList,
        currentIndex: _index,
      ),
      body: PageView.builder(
        itemCount: _itemList.length,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text("${_msgList[_index]}"),
          );
        },
      ),
    );
  }
}

main() => runApp(MaterialApp(home: BottomNav_PageView()));
