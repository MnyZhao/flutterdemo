import 'package:flutter/material.dart';

class TransAnimation extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransAnimationState();
  }
}

class TransAnimationState extends State<TransAnimation>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('平移动画'),
      ),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.cyan[300],
        child: _getAnimationWidget(),
      ),
    );
  }

  Widget _getAnimationWidget() {
    AnimationController controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    Animation<Offset> slideAnimation =
        Tween(begin: Offset(0.3, 0.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    controller.forward();
    return SlideTransition(
        position: slideAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'I Coming',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            RaisedButton(
              child: Text('click'),
              onPressed: () {
                setState(() {
                  controller.forward();
                });
              },
            )
          ],
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: TransAnimation(),
  ));
}
