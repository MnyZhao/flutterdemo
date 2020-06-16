import 'package:flutter/material.dart';
import 'file:///D:/Flutter/flutterdemo/lib/widget/scrollerwidget/CustomScrollerView/CustomScroller.dart';
import 'file:///D:/Flutter/flutterdemo/lib/widget/scrollerwidget/nestedscroller/NestedAndTabBar.dart';
import 'file:///D:/Flutter/flutterdemo/lib/widget/scrollerwidget/nestedscroller/NestedScroller.dart';
import 'package:flutterdemo/widget/scrollerwidget/ScrollerListener.dart';
import 'file:///D:/Flutter/flutterdemo/lib/widget/scrollerwidget/ScrollbarAndSingleChildScrollerView/SingleAndScrollbar.dart';
import 'file:///D:/Flutter/flutterdemo/lib/widget/scrollerwidget/RefreshIndicator/refresh.dart';

import '../../utils.dart';
import 'listview/Listandgrid_view.dart';
import 'page_demo/page_sample.dart';

class ScrollerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("滚动组件 or 滚动布局"),
      body: ListView(
        children: <Widget>[
          Text("ListView 和 gridview"),
          getFlatButton(Text("listView/GridView"), ListViewsAndGridView()),
          Text("PagerView 安卓中的 viewpager"),
          getFlatButton(Text("PagerView"), pagelist()),
          Text("CustomScroller自定义滚动模型通过sliver来自定义滚动模型（效果）例子中是一个listview，"
              "gridview的联动效果"),
          getFlatButton(Text("CustomScroller"), CustomScroller),
          Text("嵌套滚动,内部可以嵌套其他的滚动视图 常见实现展开的tabbar 隐藏的tabbar等"),
          getFlatButton(Text("NestedScroller"), NetScroller()),
          getFlatButton(Text("NestedScrollerAndTabBar"), NetScrollerTabBar),
          Text("滑动事件监听，向上滑动显示floatingActionButton，向下收起"),
          getFlatButton(Text("ScrollerListener"), ScrollerListen),
          Text("SingleAndScrollbar滚动布局和滚动条"),
          getFlatButton(Text("SingleAndScrollbar"), SingleChildScrollAndScrollbar),
          Text("下拉刷新"),
          getFlatButton(Text("下拉刷新RefreshIndicator"),refresh),
//          getFlatButton(Text("SingleAndScrollbar"), ),
//          getFlatButton(Text("Scroller滚动事件监听"), ),
        ],
      ),
    );
  }
}
