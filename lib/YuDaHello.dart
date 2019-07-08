import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.purpleAccent,
    title: 'HI',
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome First App',
            style: (TextStyle(color: Colors.black38, fontSize: 18))),
      ),
      body: HelloWorld(),
    ),
  ));
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Container(
        width: 100,
        height: 200,
        color: Colors.green,
        child: Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}
