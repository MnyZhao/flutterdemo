import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class Search extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.redAccent),
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              cursorColor: Colors.lightGreen, //光标颜色
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "用户名或邮箱",
                  hintStyle: TextStyle(color: Colors.redAccent),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.redAccent,
                  )),
              onSubmitted: null,
              controller: _controller,
            ),
          )
        ],
      ),
    );
  }
}

Widget SearchSmaple = Scaffold(
  body: Search(),
  appBar: getAppBar("Search"),
);
