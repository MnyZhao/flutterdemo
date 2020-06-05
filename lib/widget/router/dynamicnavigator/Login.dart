import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/router/dynamicnavigator/LoginSuccess.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
//class Logins extends StatelessWidget {
  TextEditingController _controller_username = TextEditingController();
  TextEditingController _controller_pwd = TextEditingController();
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (String string) {
                    username = string;
                  },
                  controller: _controller_username,
                  autofocus: true,
                  //自动获取焦点
                  cursorColor: Colors.lightGreen,
                  //光标颜色
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  onChanged: (String string) {
                    password = string;
                  },
                  controller: _controller_pwd,
                  cursorColor: Colors.lightGreen,
                  obscureText: true,
                  //隐藏正在编辑的文本
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: '输入登陆密码',
                      prefixIcon: Icon(Icons.lock)),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
//                if (('mny' == username) && ('123' == password)) {
//                  print('Successful');
//                }else{
//                  print('Error');
//                }
                    if (('mny' == _controller_username.text) &&
                        ('123' == _controller_pwd.text)) {
                      print('Successful');
                      Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                          (BuildContext context, Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                        return LoginSuccess(userName: username);
                      }));
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('$username name or pwd Error'),
                        duration: Duration(microseconds: 200),
                      ));
                    }
                  },
                )
              ],
            ),
          );
        }));
  }
}

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}
