import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

class GetText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GetTextState();
  }
}

class GetTextState extends State<GetText> {
  TextEditingController _controller = new TextEditingController();
  String _str = '点击Button改变内容';

  getTexts() {
    setState(() {
      _str = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextField(
            autofocus: true,
            controller: _controller,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person))),
        Text(_str),
        RaisedButton(
          child: Text("Click"),
          onPressed: () {
            getTexts();
            showDialog(
                context: context,
                child: new AlertDialog(
                  title: new Text('What you typed'),
                  content: new Text(_controller.text),
                ));
          },
        )
      ],
    );
  }
}

class getTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new BaseAppBar(titleMsg: 'GetText').getAppBar(),
      body: GetText(),
    );
  }
}
