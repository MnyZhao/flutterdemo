import 'package:flutter/material.dart';
import 'package:flutterdemo/flutter_widget/scrollerwidget/gridview/ColumGridView.dart';
import 'package:flutterdemo/flutter_widget/scrollerwidget/gridview/Default.dart';
import 'package:flutterdemo/flutter_widget/scrollerwidget/gridview/MGridAddData.dart';
import 'package:flutterdemo/utils.dart';


import 'ListViewBuilder.dart';
import 'ListViewDefault.dart';
import 'ListViewSeparated.dart';

class ListViewsAndGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("ListView"),
      body: ListView(children: <Widget>[
        Text("默认构造函数创建适合少量数据"),
        getFlatButton(Text("listView()"), ListViewDefaulet()),
        Text("Builder命名构造韩素华创建适合操作大量集合数据"),
        getFlatButton(
          Text("listViewBuilder"),
          ListViewBuilders(),
        ),
        Text("Separated命名构造函数创建给item之间设置间隔线"),
        getFlatButton(
          Text("ListViewSeparated"),
          ListViewSeparateds(),
        ),
        Text("GrideView.默认构造函数创建适合少量数据"),
        getFlatButton(
          Text("GrideView()"),
          GridViewDefault(),
        ),
        Text("builder命名构造函数创建适合操作大量集合数据，GrideView 模拟数据添加"),
        getFlatButton(
          Text("GrideView.builder"),
          MGridAddData(),
        ),
        Text("Column中使用Gridview"),
        getFlatButton(
          Text("Column中使用Gridview"),
          ColumnGrideView(),
        ),
        Text("ListView 和 GrideView item点击事件可以给itembuilder设置点击"),
        Text(" 命名构造 GrideView.custom,GrideView.extent也可以创建gridview  "),
      ]),
    );
  }
}
