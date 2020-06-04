import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Switch(
          value: _switchSelected,
          activeColor: Colors.purpleAccent,
          onChanged: (bool value) {
            setState(() {
              _switchSelected = value;
              print('_switchSelected $_switchSelected');
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.lightGreen,
          onChanged: (bool value) {
            setState(() {
              _checkboxSelected = value;
              print('_checkboxSelected $_checkboxSelected');
            });
          },
        )
      ],
    );
  }
}

class SwitchAndCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Switch--CheckBox")),
      body: SwitchAndCheckBoxTestRoute(),
    );
  }
}
