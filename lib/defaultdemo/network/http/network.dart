import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class GetUserInfo extends StatelessWidget {
  String _text;

  // 用async 标记的函数返回类型必须是future
  Future<String> getHttp() async {
    try {
      //创建一个HttpClient
      HttpClient httpClient = new HttpClient();
      //打开Http连接
//      HttpClientRequest request = await httpClient
//          .getUrl(Uri.parse("https://www.baidu.com")) as HttpClientRequest;
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("https://api.github.com/users/flyou")) as HttpClientRequest;
//      //使用iPhone的UA
//      request.headers.add("user-agent",
//          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close() as HttpClientResponse;
      //读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
//      print(response.headers);
      print(_text);
      //关闭client后，通过该client发起的所有请求都会中止。
      httpClient.close();
    } catch (e) {
      _text = "请求失败：$e";
    } finally {
//      setState(() {
//        _loading = false;
//      });
    }
    return _text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Click get Http'),
              onPressed: () {
                print('123');
                getHttp();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GetUserInfo(),
  ));
}
