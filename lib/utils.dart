import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Builder getFlatButton(
  Widget child,
  Widget skipRoutr, {
  Color color = Colors.redAccent,
  Color highlightColor = Colors.red,
  Color splashColor = Colors.grey,
}) {
  return Builder(builder: (BuildContext context) {
    return FlatButton(
      color: color,
      highlightColor: highlightColor,
      colorBrightness: Brightness.dark,
      splashColor: splashColor,
      child: child,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {
        RouterPush(context, skipRoutr);
      },
    );
  });
}

RouterPush(BuildContext context, Widget widget) {
  Navigator.of(context).push(getRouter(widget));
}

getRouter(Widget widget) {
  return MaterialPageRoute(builder: (context) {
    return widget; //路由B
  });
}

getAppBar(String titlemsg) {
  return AppBar(title: Text(titlemsg));
}
