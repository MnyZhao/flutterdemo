import 'package:flutter/material.dart';
void main() => runApp(MApp());

class MApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcome flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('welcome hellodata'),
        ),
        body: Center(
          child: Text("helloworld"),
        ),
      ),
    );
  }
}
