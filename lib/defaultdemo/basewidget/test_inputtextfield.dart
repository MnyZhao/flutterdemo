import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "test Inputtext",
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Input Text Feild"),
        ),
        body: InputText(),
      ),
    );
  }
}

class InputText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputTextState();
  }
}

class InputTextState extends State<InputText> {
  var _user_err;
  TextEditingController _controller=TextEditingController();

  _onChange(String value) {
    setState(() {
      if (value.length != 11) {
        _user_err = "手机号输入错误";
      } else {
        _user_err = null;
      }
    });
  }

  void _login() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            // 自动获取焦点
            autofocus: true,
            // 监听键盘输入
            onChanged: _onChange,
            onEditingComplete: (){
              print("用户输入完成 ${_controller.text}");
            },
            onSubmitted: (value) {
              // 监听键盘上的提交按钮点击
              print("submit $value");
            },
            // 显示在文本周围的装饰
            decoration: InputDecoration(
              // 去掉下划线
//                border: InputBorder.none,
              labelText: "用户名",
              hintText: "请输入11位手机号",
              errorText: _user_err,
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              labelStyle: TextStyle(
                color: Colors.green,
              ),
              prefixIcon: Icon(Icons.person),
              counterText: "30",
            ),
            // 文字样式
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            // 自动获取焦点
            autofocus: true,
            obscureText: true,
            // 显示在文本周围的装饰
            decoration: InputDecoration(
                // 去掉下划线
//                border: InputBorder.none,
                labelText: "密码",
                hintText: "请输出密码",
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
                prefixIcon: Icon(Icons.lock)),
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
