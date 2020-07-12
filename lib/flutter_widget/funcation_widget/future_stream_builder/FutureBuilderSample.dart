import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class FutureBuilders extends StatelessWidget {
  /// Future 要在initState里初始化 否则当调用setState 函数 Future将重新构建
  ///  官方文档给出的描述 尽早的获取到Future
  ///  The [future] must have been obtained earlier, e.g. during [State.initState],
  /// [State.didUpdateConfig], or [State.didChangeDependencies]. It must not be
  /// created during the [State.build] or [StatelessWidget.build] method call when
  /// constructing the [FutureBuilder]. If the [future] is created at the same
  /// time as the [FutureBuilder], then every time the [FutureBuilder]'s parent is
  /// rebuilt, the asynchronous task will be restarted.
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 5), () => "我是从互联网上获取的数据");
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(), // 异步任务
        initialData: "等待获取数据", // 初始值
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Widget FutureBuilderSample = Scaffold(
  appBar: getAppBar("异步更新Ui FutureBuilder"),
  body: FutureBuilders(),
);

main() => runApp(MaterialApp(
      home: FutureBuilderSample,
    ));
