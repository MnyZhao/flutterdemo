import 'package:flutter/material.dart';
import 'package:flutterdemo/dionet/netutil/DioManager.dart';
import 'model/ListMovie.dart';

class TestHttp extends StatelessWidget {
//  page=0&pageSize=25&type=同性

  @override
  Widget build(BuildContext context) {
    Future getMovieList() async {
      await DioManager.getInstance(baseUrl: "http://192.168.137.1:8080")
          .httpRequestCallBack(context, "/getMovieList",
              queryParameters: {'page': '0', 'pageize': '25', 'type': '同性'},
              onSuccess: (json) {
        ListMovie.fromJson(json).movie;
      });
    }

    return Center(
        child: ListView(
      children: <Widget>[
        FlatButton(
          color: Colors.redAccent,
          child: Text("GetQueryParams"),
          onPressed: () async {
            DioManager.getInstance(baseUrl: "http://192.168.137.1:8080")
                .httpRequest(
              context,
              "/getMovieList",
              queryParameters: {'page': '0', 'pageize': '25', 'type': '同性'},
            ).then((value) {
              print(value);
            }).catchError((e) {
              print(e.toString());
            });
          },
        ),
      ],
    ));
  }
}

main() => runApp(MaterialApp(
      home: TestHttp(),
    ));
