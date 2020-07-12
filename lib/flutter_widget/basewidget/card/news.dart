import 'package:flutter/material.dart';

import '../../../utils.dart';

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getNewsItem();
  }

  Widget _getNewsItem() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
        child: Material(
          // 设置圆角
          borderRadius: BorderRadius.circular(6.0),
          //设置阴影
          elevation: 2.0,
          child: _getListTile(),
        ),
      ),
    );
  }

  Widget _getListTile() {
    return Container(
      height: 95.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
              tag: "123",
              child: _getImageWidget(
                "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2549558913.jpg"
//                  "https://p.ssl.qhimg.com/dmfd/400_300_/t0104e4d3e0b38796d8.jpg"
              )),
          _getTextColumn(),
        ],
      ),
    );
  }

  Widget _getImageWidget(String url) {
    return Container(
      width: 95.0,
      height: 95.0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0), bottomLeft: Radius.circular(6.0)),
        child: _getImageNetWork(url),
      ),
    );
  }

  Widget _getImageNetWork(String url) {
    try {
      if (url.isNotEmpty) {
        return new FadeInImage.assetNetwork(
          placeholder: 'images/sea.jpg',
          image: url,
          fit: BoxFit.cover,
        );
      } else {
        return new Image.asset('images/sea.jpg');
      }
    } catch (e) {
      return new Image.asset('images/sea.jpg');
    }
  }

  Text _getTitleWidget(String currentName) {
    return Text(
      currentName,
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Text(
        description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Text _getDateWidget(String date) {
    return new Text(
      new DateUtil().buildDate(date),
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  Widget _getTextColumn() {
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getTitleWidget('124'),
              _getDateWidget(DateTime.now().toIso8601String()),
              _getDescriptionWidget(
                  "你好啊你好啊你好啊你好啊 脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼脑壳疼")
            ],
          ),
        ));
  }
}

class DateUtil {
  var mouths = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  String buildDate(String date) {
    try {
      var datatime = DateTime.parse(date);
      return "${datatime.day} de ${mouths[datatime.month - 1]} de ${datatime
          .year} às ${datatime.hour}:${datatime.minute}";
    } catch (e) {
      return "";
    }
  }
}

Widget Item = Scaffold(
  appBar: getAppBar("Material实现卡片效果"),
  body: NewsItem(),
);
