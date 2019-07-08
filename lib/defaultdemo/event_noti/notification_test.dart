import 'package:flutter/material.dart';

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

class NotifaicationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NotifaicationRouteState();
  }
}

class NotifaicationRouteState extends State<NotifaicationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                return RaisedButton(
                  //按钮点击时分发通知
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('通知'),
      ),
      body: NotifaicationRoute(),
    ),
  ));
}
