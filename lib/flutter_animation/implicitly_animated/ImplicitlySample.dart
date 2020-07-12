import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class Impli extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImpliState();
  }
}

class ImpliState extends State<Impli> {
  Color _color = Colors.amberAccent;
  var width = 100.0;
  var height = 100.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("隐式动画"),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.lightBlueAccent),
          onPressed: () {
            setState(() {
              _color = _color == Colors.greenAccent
                  ? Colors.amberAccent
                  : Colors.greenAccent;
              width = width == 300.0 ? 100 : 300;
              height = height == 300.0 ? 100 : 300;
            });
          }),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          color: _color,
          width: width,
          height: height,
          duration: Duration(milliseconds: 3 * 1000),
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}

main() => runApp(MaterialApp(
      home: Impli(),
    ));
