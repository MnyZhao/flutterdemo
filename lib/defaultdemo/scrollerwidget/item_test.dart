import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: HotItem(),
    ),
  ));
}

class HotItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotItemState();
  }
}

class HotItemState extends State<HotItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return body();
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.cyanAccent,
        elevation: 4,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(tag: '123', child: _getImageNet(null)),
//            _getImageNet(null),
            _getGradient(),
//          _getImageNet(
//              "http://5b0988e595225.cdn.sohucs.com/images/20180324/1736819eb11340dd9aaffc7b6f92c318.jpeg"),
            _getText(),
          ],
        ),
      ),
    );
  }

  /**
   * 渐变色
   */
  Widget _getGradient() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        )),
      ),
    );
  }

  /**
   * 获取网络图片
   */
  Widget _getImageNet(url) {
    try {
      if (url != '') {
        return ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: new FadeInImage.assetNetwork(
            height: 400.0,
            placeholder: 'images/leak.jpg',
            image: url,
            fit: BoxFit.cover,
            alignment: new FractionalOffset(
              0.5 + (1 / 3),
              0.5,
            ),
          ),
        );
      } else {
        return ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Image.asset(
              'images/place_holder_2.jpg',
              fit: BoxFit.cover,
            ));
      }
    } catch (e) {
      return ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: Image.asset(
            'images/place_holder_2.jpg',
            fit: BoxFit.cover,
          ));
    }
  }

  Widget _getText() {
    return Positioned(
        bottom: 56.0,
        left: 32.0,
        right: 32.0,
        child: Column(
          children: <Widget>[
            Text(
              '1234',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
            Text('1234dfasdfasdfasdfasdfasdfasdfasdf',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ));
  }
}
