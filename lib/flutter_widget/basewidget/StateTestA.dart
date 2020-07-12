import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

import 'StateTestB.dart';

class StateSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateSamplesState();
  }
}

//WidgetsBindingObserver来监听AppLifecycleState， 而AppLifecycleState有4种状态：resumed inactive paused suspending
/*
1、 resumed 界面可见， 同安卓的onResume。

2、inactive界面退到后台或弹出对话框情况下， 即失去了焦点但仍可以执行drawframe回调；同安卓的onPause；

3、paused应用挂起，比如退到后台，失去了焦点且不会收到drawframe回调；同安卓的onStop；

4、suspending， iOS中没用，安卓里就是挂起，不会再执行drawframe回调；
*/
class StateSamplesState extends State<StateSamples>
    with WidgetsBindingObserver {
  int msg = 0;

  @override
  Widget build(BuildContext context) {
    print(" A build");
    return Scaffold(
        appBar: getAppBar("生命周期"),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                msg += 1;
              });
            },
            child: Icon(Icons.add)),
        body: ListView(children: [
          Center(child: Text("$msg")),
          FlatButton(
              onPressed: () {
//                Navigator.pushAndRemoveUntil(
//                    context, getRouter(widget), (route) => route == null);
                Navigator.push(context, getRouter(StateSampleB()));
              },
              child: Text("跳转B 观察生命周期")),
        ]));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("A initState");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("A didChangeDependencies");
  }

  @override
  void didUpdateWidget(StateSamples oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("A didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("A deactive");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("A dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("A reassemble");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("A resumed");
        break;
      case AppLifecycleState.detached:
        print("A detached");
        break;
      case AppLifecycleState.inactive:
        print("A inactive");
        break;
      case AppLifecycleState.paused:
        print("A paused");
        break;
      // Nothing to do.
    }
  }
}

class StateSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StateSamples();
  }
}
