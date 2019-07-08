//有状态的widget
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Counter(
      title: 'WTF',
    ),
  ));
}

class Counter extends StatefulWidget {
  String title;

  Counter({this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterStates();
  }
}

class _CounterStates extends State<Counter> {
  int _counter = 0;

  void _increment() {
    //setState 方法用来改变变量值
    setState(() {
      _counter++;
    });
  }

  void _subcrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
        children: <Widget>[
          Text('Count: $_counter'),
          RaisedButton(
            onPressed: _increment,
            child: Text('add'),
          ),
          RaisedButton(
            onPressed: _subcrement,
            child: Text('sub'),
          )
        ],
      )),
    );
  }
}
