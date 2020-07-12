import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class StreamBuilders extends StatelessWidget {
  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 3), (i) => i);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: StreamBuilder<int>(
        stream: counter(), //
        //initialData: ,// a Stream<int> or null
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据...');
            case ConnectionState.active:
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return Text('Stream已关闭');
          }
          return null; // unreachable
        },
      ),
    );
  }
}

Widget StreamBuilderSample = Scaffold(
  appBar: getAppBar("StreamBuilder"),
  body: StreamBuilders(),
//  body: test(),
);

main() => runApp(MaterialApp(
      home: StreamBuilderSample,
    ));
