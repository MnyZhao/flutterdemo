import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav> {
  int _tabIndex = 0;
  List<MsgPage> _bodys = [
    MsgPage(
      title: 'Home',
    ),
    MsgPage(
      title: 'Business',
    ),
    MsgPage(
      title: 'School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: _bodys[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
      ),
    );
  }
}

class MsgPage extends StatelessWidget {
  MsgPage({this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('$title'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BottomNav(),
  ));
}
