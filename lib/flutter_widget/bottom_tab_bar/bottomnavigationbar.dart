import 'package:flutter/material.dart';

import '../../utils.dart';
import 'Pager.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  List<Pager> list = <Pager>[
    Pager("Email"),
    Pager("SMS"),
    Pager("Phone"),
  ];
  var _index = 0;
  List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text("Email")),
    BottomNavigationBarItem(icon: Icon(Icons.sms), title: Text("SMS")),
    BottomNavigationBarItem(icon: Icon(Icons.phone), title: Text("phone")),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("底部导航"),
      body: list[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

main() => runApp(MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.grey, accentColor: Colors.redAccent),
      home: BottomNavigation(),
    ));
