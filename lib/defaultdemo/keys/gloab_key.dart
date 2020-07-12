import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils.dart';

class TestGloabKey extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestGloabKeyState();
}

class TestGloabKeyState extends State<TestGloabKey> {
  var _count = 0;
  GlobalKey<MyTextState> global = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("fuck"),
      body: Column(
        children: [
          FlatButton(
            child: Text("$_count"),
            color: Colors.blue,
            onPressed: () {
              _count++;
              global.currentState.onPressed(_count);
            },
          )
        ],
      ),
    );
  }
}

class MyText extends StatefulWidget {
  final Key key;

  const MyText(this.key);

  @override
  State<StatefulWidget> createState() {
    return MyTextState();
  }
}

class MyTextState extends State<MyText> {
  var text;

  void onPressed(int count) {
    text = "$count";
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

main() => runApp(MaterialApp(
      home: TestGloabKey(),
    ));
