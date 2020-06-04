import 'package:flutter/material.dart';

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
          getFlatButton(Text("listView/GridView"), ListViewsAndGridView()),
          getFlatButton(Text("PagerView"), pagelist()),
//          getFlatButton(Text("NestedScroller"), ),
//          getFlatButton(Text('''RefreshIndicator\n RefreshLayout'''), ),
//          getFlatButton(Text("SingleAndScrollbar"), ),
//          getFlatButton(Text("Scroller滚动事件监听"), ),
        ],
      ),
    );
  }
}
