import 'package:flutter/material.dart';

class Expandeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expanded'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 10000.0,
                  width: 9000.0,
                  color: Colors.blue,
                ),
              ),
            ],
          )),
    );
  }
}

void main() {
  runApp(Expandeds());
}
