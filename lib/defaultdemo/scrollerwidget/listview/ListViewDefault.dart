import 'package:flutter/material.dart';

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

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
            title: Text('ListView'),
            leading: Builder(builder: (BuildContext builde) {
              return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: null);
            })),
        body: ListViews(),
    ),
  ));
}
