import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final callback;

  BottomNavigation(this.callback);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.language), title: Text(('tab_recentes'))),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_library), title: Text(('tab_noticias'))),
        BottomNavigationBarItem(
            icon: Icon(Icons.info), title: Text(('tab_recentes'))),
      ],
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
          widget.callback(index);
        });
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      bottomNavigationBar: new BottomNavigation((value) {
        print(value.toString());
      }),
    ),
  ));
}
