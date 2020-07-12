import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class StateSampleB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateSampleBState();
  }
}

class StateSampleBState extends State<StateSampleB> {
  int msg = 0;

  @override
  Widget build(BuildContext context) {
    print("B build");
    return Scaffold(
      appBar: getAppBar("生命周期"),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
           Navigator.of(context).pop();
          },
          child: Icon(Icons.add)),
      body: Center(child: Text("$msg")),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("B initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("B didChangeDependencies");
  }

  @override
  void didUpdateWidget(StateSampleB oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("B didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("B deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("B dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("B reassemble");
  }
}

