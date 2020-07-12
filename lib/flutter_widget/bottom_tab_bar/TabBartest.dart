import 'package:flutter/material.dart';

class MTabBarSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabBarState();
  }
}

class TabBarState extends State<MTabBarSample> {
  List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.add), text: 'Add'),
    Tab(icon: Icon(Icons.email), text: 'Email'),
    Tab(icon: Icon(Icons.comment), text: 'Comment'),
    Tab(icon: Icon(Icons.contact_phone), text: 'Contact'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
            tabs: myTabs,
            isScrollable: true,
            indicatorColor: Colors.red,
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
            children: myTabs
                .map((Tab tab) => Center(child: Text(tab.text)))
                .toList()),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MTabBarSample(),
  ));
}
