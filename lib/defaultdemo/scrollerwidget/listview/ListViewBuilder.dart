import 'package:flutter/material.dart';

/**
 * itemBuilder 包含多个item
 */
class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$index'),
        );
      },
      itemCount: 7,
      padding: EdgeInsets.all(8.0),
    );
  }
}

class Show extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView.builder"),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(icon: Icon(Icons.arrow_back), onPressed: null);
          }),
        ),
        body: ListViewBuilder(),
      ),
    );
  }
}

void main() {
  runApp(Show());
}
