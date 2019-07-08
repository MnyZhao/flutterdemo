import 'package:flutter/material.dart';

/**
 * 先建立数据共享父控件
 */
class ShareDataWidget extends InheritedWidget {
  int data; //传递的值
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

/**
 * 建立接受数据的子view
 */
class _TextContant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextContantState();
  }
}

class _TextContantState extends State<_TextContant> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context).data.toString());
    ;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}

class _Click extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClickState();
  }
}

class ClickState extends State<_Click> {
  int count=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text('数据传递')),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: _TextContant(),
                ),
                RaisedButton(
                  onPressed: () => setState(() => ++count),
                  child: Text('click'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: _Click(),
  ));
}
