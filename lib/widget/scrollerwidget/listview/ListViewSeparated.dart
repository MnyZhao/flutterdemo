import 'package:flutter/material.dart';

import '../../../utils.dart';

/**
 * separatorBuilder带分割线的ListView
 */
class ListViewSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider divider1 = Divider(
      height: 1.0,
      indent: 8.0,
      color: Colors.purple,
    );
    Divider divider2 = Divider(
      height: 1.0,
      indent: 8.0,
      color: Colors.lightBlueAccent,
    );
    Widget divider3 = Container(
        height: 1.0,
        margin: EdgeInsets.only(left: 10, right: 10),
        color: Colors.black);
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('$index'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider3;
        },
        itemCount: 20);
  }
}

class ListViewSeparateds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("Separated"),
      body: ListViewSeparated(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ListView.separated'),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: null,
          );
        }),
      ),
      body: ListViewSeparated(),
    ),
  ));
}
