import 'package:flutter/material.dart';

class PointEvenet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PointEventState();
  }
}

class PointEventState extends State<PointEvenet> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      child: Scaffold(
        appBar: AppBar(
          title: Text('原始指针事件处理 滑动屏幕'),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300.0,
          height: 150.0,
          child: Text(_event?.toString() ?? "",
              style: TextStyle(color: Colors.white)),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
      onPointerCancel: (PointerCancelEvent event) =>
          setState(() => _event = event),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PointEvenet(),
  ));
}
