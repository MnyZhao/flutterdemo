import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

/**
 * 默认的只包含一个children
 */
class ListTiles extends StatelessWidget {
  ListTiles({this.name, this.iconData});

  IconData iconData;
  String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(iconData),
      title: Text(name),
    );
  }
}

class ListViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTiles(
          name: 'Mny',
          iconData: Icons.ac_unit,
        ),
        ListTiles(
          name: 'Dec',
          iconData: Icons.dashboard,
        ),
        ListTiles(
          name: 'Oct',
          iconData: Icons.open_with,
        )
      ],
    );
  }
}

class ListViewDefaulet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("Listview"),
      body: ListViews(),
    );
  }
}
