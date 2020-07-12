import 'package:flutter/material.dart';
import 'package:flutterdemo/flutter_Eventhandl_notification/event_notify_sample.dart';
import 'package:flutterdemo/utils.dart';

import 'dionet/test.dart';
import 'flutter_animation/animation_sample.dart';
import 'flutter_Eventhandl_notification/gesture/GestureSmaple.dart';
import 'flutter_widget/basewidget/base.dart';
import 'flutter_widget/bottom_tab_bar/bar.dart';
import 'flutter_widget/click/AddClick.dart';
import 'flutter_widget/click/MyItemWidget.dart';
import 'flutter_widget/container_widget/containersample.dart';
import 'flutter_widget/flutterchinasmaple/FlutterChinaLayoutClick.dart';
import 'flutter_widget/funcation_widget/funcation_sample.dart';
import 'flutter_widget/layoutwidget/layout.dart';
import 'flutter_widget/router/router.dart';
import 'flutter_widget/scrollerwidget/scrollerView.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "widget_show",
        theme: ThemeData(
          primaryColor: Colors.redAccent, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: Colors.greenAccent), //用于Icon颜色
        ),
        home: _homeWidget(context)
    );

  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _homeWidget(context);
  }
}

Widget _homeWidget(BuildContext context) {
  return Scaffold(
    appBar: getAppBar(),
    drawer: getDrawer(),
    body: getListView(),
  );
}

// 可以传递contex 也可以使用
AppBar getAppBar() {
  return AppBar(
    title: Text("WidgetShow"),
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        color: Colors.white,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    }),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.share), onPressed: null),
    ],
  );
}

Builder getDrawer() {
  return Builder(builder: (BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.redAccent,
          ),
          child: Center(
            child: new CircleAvatar(
              backgroundImage: AssetImage('images/leak.jpg'),
              radius: 35.0,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text("Message"),
          onTap: () {
            Navigator.pop(context); // 关闭侧边栏
            // 开启snackbar
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('hello check your email please'),
              duration: Duration(milliseconds: 20000),
              action: SnackBarAction(
                label: "ok",
                onPressed: () {}, // 传递一个空函数点击label利己关闭
                // 或者调用 Scaffold.of(context).hideCurrentSnackBar(),里面的context
                // 一定是未销毁的context 在这调用这个方法是不行的
                // 当侧标栏关闭后 context 就销毁了
                // 保存下来也不行 不知道为什么
              ),
            ));
          },
        )
      ],
    ));
  });
}

getListView() {
  return ListView(
    padding: EdgeInsets.only(left: 30, right: 30),
    children: <Widget>[
      getFlatButton(Text("基础组件"), BaseWidget()),
      getFlatButton(Text("容器组件"), ContainerSample()),
      getFlatButton(Text("滚动组件"), ScrollerView()),
      getFlatButton(Text("功能组件"), FuncationSample()),
      getFlatButton(Text("布局"), Layout()),
      getFlatButton(Text("路由跳转"), Router()),
      getFlatButton(Text("导航栏"), ShowBar()),
      getFlatButton(Text("事件处理与通知"), EventNotifySample()),
      getFlatButton(Text("点击事件添加"), ClickSample()),
      getFlatButton(Text("点击水波纹InkWell"), inkwellSmaple),
      getFlatButton(Text("动画"), AnimationSample()),
      getFlatButton(Text("flutter中文网布局示例"), ChinaLayoutSmaple),
      getFlatButton(Text("flutter中文网布局示例"), TestHttp()),
    ],
  );
}
