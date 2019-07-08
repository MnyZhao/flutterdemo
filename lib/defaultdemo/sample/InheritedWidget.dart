import 'package:flutter/material.dart';

/**
 * 数据共享
 * InheritedWidget 将数据向下传递
 * 高效的将数据在Widget树中向下传递、共享，这在一些需要在Widget树中共享数据的场景中非常方便，
 * 如Flutter中，正是通过InheritedWidget来共享应用主题(Theme)和Locale(当前语言环境)信息的。
 */

//首先我们通过继承InheritedWidget，将当前计数器点击次数保存在ShareDataWidget的data属性中：
class ShareDataWidget extends InheritedWidget {
  int data; //点击次数
  ShareDataWidget({
    this.data,
    Widget child,
  }) : super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

//然后我们实现一个子widget _TestWidget，在其build方法中引用ShareDataWidget中的数据；
// 同时，在其didChangeDependencies() 回调中打印日志：
class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestWidgetState();
  }
}

class TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('Dependencies Change');
  }
}

//最后我们定义一个button 每点击一次就将ShareDataWidhet 值自增
class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InheritedWidgetTestRouteState();
  }
}

// ignore: unexpected_token
class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('数据共享')),
        body: ShareDataWidget(
          data: count,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: _TestWidget(),
                ),
                RaisedButton(
                  child: Text('Increment'),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(home: InheritedWidgetTestRoute()));
}
