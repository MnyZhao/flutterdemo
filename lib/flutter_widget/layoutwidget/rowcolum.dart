import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'package:flutterdemo/utils.dart';

/**
 * 线性布局 row 行  column  列
 */
class rowcolum extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new rowandcolum();
  }
}

class rowandcolum extends State<rowcolum> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text('手势检测'),
                      content: new Text('手势检测'),
                    ));
              },
              child: Icon(
                Icons.lock,
                color: Colors.lightGreenAccent,
              ),
            ),
            Icon(
              Icons.ac_unit,
              color: Colors.lightGreenAccent,
            ),
            Icon(
              Icons.backup,
              color: Colors.lightGreenAccent,
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0, right: 8.0),
          color: Colors.black,
          height: 1.0,
        ),
        RaisedButton(
            child: Text("Click"),
            onPressed: () {
              print('click');
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text('Column'),
                    content: new Text('Columns'),
                  ));
            })
      ],
    );
  }
}

class RowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar('线性布局row column'),
      body: rowcolum(),
    );
  }
}
