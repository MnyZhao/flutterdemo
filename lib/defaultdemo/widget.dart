import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('container'),
      ),
      body: Container(
        color: Colors.blueAccent,
      ),
    ),
  ));
}
