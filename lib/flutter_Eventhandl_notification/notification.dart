import 'package:flutter/material.dart';

/**
 * 自定义通知
 */
//1 定义一个通知类，要继承自Notification类；
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
      // 通知处理回调
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
                  //按钮点击时 dispatch分发通知
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

Widget NotificationSample = Scaffold(
  appBar: AppBar(
    title: Text('通知'),
  ),
  body: NotifaicationRoute(),
);
