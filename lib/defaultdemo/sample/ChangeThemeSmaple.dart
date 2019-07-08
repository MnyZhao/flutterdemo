import 'package:flutter/material.dart';

class ChangeThemeSmaple extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangeThemeSmapleState();
  }
}

class ChangeThemeSmapleState extends State<ChangeThemeSmaple> {
  Color _color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: _color, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _color), //用于Icon颜色
          textTheme: TextTheme(
              display1: TextStyle(
                color: _color,
              )),
          buttonTheme: ButtonThemeData(
              buttonColor: _color,
          )),
      title: 'ChangeThemeState',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ChangTheme'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.line_style,
                    ),
                    Text(
                      '颜色跟随主题',
                      style: TextStyle(color: _color),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.apps,
                      color: Colors.black,
                    ),
                    Text(
                      '颜色固定黑色',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _color = (_color == Colors.amber ? Colors.red : Colors.amber);
            });
          },
          child: Icon(Icons.change_history,color: Colors.lightGreen,),
          foregroundColor: _color,
        ),
      ),
    );
  }
}

void main() {
  runApp(ChangeThemeSmaple());
}
