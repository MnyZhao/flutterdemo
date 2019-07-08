import 'package:flutter/material.dart';

class ThemeSmaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ThemeSmaple',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ThemeDateSmaple'),
        ),
        body: Center(
          child: Text('ThemeSmaple'),
        ),
      ),
    );
  }
}

void main() {
  runApp(ThemeSmaple());
}
