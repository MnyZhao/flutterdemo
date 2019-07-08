import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Material',
    home: DefaultAppScaffold(),
  ));
}

AppBar MyAppBar = AppBar(
  title: Text('MaterialDefault'),
  //leading 在标题之前显示的小部件
  leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
  //在标题之后显示的小部件
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.playlist_play),
      tooltip: 'Air it',
      onPressed: null,
    ),
    IconButton(
      icon: Icon(Icons.playlist_play),
      tooltip: 'Air it',
      onPressed: null,
    )
  ],
);

class DefaultAppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar,
      body: Center(
          child: Container(
              color: Colors.lightBlue[900],
              width: 200.0,
              height: 300.0,
              child: Center(
                  child: Text(
                "First Material App",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w100),
              )))),
      //        设置FloatingActionButton位置
      //centerDocked 底部中间
      //endDocked 底部右侧
      //centerFloat 中间偏上
      //endFloat 底部偏上
//      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'Add',
          foregroundColor: Colors.lightGreenAccent,
          backgroundColor: Colors.purpleAccent,
          child: Icon(Icons.add, color: Colors.lightBlueAccent)),
    );
  }
}
