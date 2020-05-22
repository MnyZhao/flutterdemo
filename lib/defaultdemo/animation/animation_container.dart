import 'package:flutter/material.dart';

class AnimationCon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationConState();
  }
}

class AnimationConState extends State<AnimationCon> {
  double animValue = 100.0;

  _changeValue() {
    setState(() => animValue = animValue == 0 ? 100.0 : 0.0);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimationContainer'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              new AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: new Duration(seconds: 3),
                child: new FlutterLogo(size: 100.0,),
                padding: EdgeInsets.only(bottom: animValue),
              ),
              SizedBox(height: 30.0,),
              new RaisedButton(
                child: new Text('GO'),
                onPressed: _changeValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void main() {
  runApp(AnimationCon());
}
