import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';

/**
 *
 *  只需要指定路径就可以assets:
 *   - images/
 * 在工程根目录下创建一个images目录，并将图片avatar.png拷贝到该目录。
 *
 *   在pubspec.yml中的flutter部分添加如下内容：
 *
 *   assets:
 *   - images/avatar.png
 *   加载该图片
 *
 *   Image(
 *  image: AssetImage("images/avatar.png"),
 *  width: 100.0
 *   );
 */
class ImageAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Column(
          //直接设置
          children: <Widget>[
            Text('加载本地图片'),
            Image(
              image: AssetImage("images/leak.jpg"),
              height: 240.0,
              fit: BoxFit.none, //缩放模式
            ),
            //通过asset函数设置
            Image.asset(
              "images/leak.jpg",
              height: 240.0,
              fit: BoxFit.cover,
            ),
            Text('加载网络图片'),
            //直接设置
            Image(
              image: NetworkImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              ),
              width: 100.0,
            ),
            //通过network函数设置
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
            ),
            Text('Icon展示'),
            Row(
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ImageAndIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("imageAndIcon")),
      body: ImageAndIcon(),
    );
  }
}
