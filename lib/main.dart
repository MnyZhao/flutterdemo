import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/widget/basewidget/ImageAndIcon.dart';
import 'package:flutterdemo/widget/basewidget/SwitchAndCheckBox.dart';

import 'widget/basewidget/Text.dart';
import 'widget/basewidget/TextFiledSample/TextFieldShow.dart';
import 'widget/basewidget/TextFiledSample/TextFiled.dart';
import 'widget/basewidget/button.dart';
import 'widget/layoutwidget/layout.dart';
import 'widget/scrollerwidget/scrollerView.dart';

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
        home: _homeWidget(context));
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
      getFlatButton(Text("text"), MText()),
      getFlatButton(Text("TextField(输入)"), TextFieldShow()),
      getFlatButton(Text("按钮"), ShowButton()),
      getFlatButton(Text("ImageAndIcon"), ImageAndIconWidget()),
      getFlatButton(Text("SwitchAndCheckBox"), SwitchAndCheckBox()),
      getFlatButton(Text("布局"), Layout()),
      getFlatButton(Text("滑动列表"), ScrollerView()),

    ],
  );
}
