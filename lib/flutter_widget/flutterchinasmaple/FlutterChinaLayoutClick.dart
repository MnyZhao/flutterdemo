import 'package:flutter/material.dart';

Widget ChinaLayoutSmaple=Scaffold(
      appBar: AppBar(
        title: Text('China'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                print('menu');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: ChinaLayout(),
    );

class ChinaLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: ListView(
        children: <Widget>[
          Title(),
          TitleO1Layot(),
          Title02layout(),
          TextLayout()
        ],
      ),
    );
  }
}

class TitleO1Layot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Title01LayoutState();
  }
}

class Title01LayoutState extends State<TitleO1Layot> {
  bool _isFavorited = true; //是否选中
  int _favoriteCount = 41;

  void _isSelect() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Container(
      color: Colors.greenAccent,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
      child: Text('Oeschinen Lake Campground',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
          )),
    ),
                Text('Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ))
              ],
            ),
          ),
          Center(
            child: IconButton(
              onPressed: _isSelect,
//                color: Colors.red[500],
//                icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)
              icon: Icon(
                _isFavorited ? Icons.star : Icons.star_border,
                color: _isFavorited ? Colors.red : Colors.grey,
              ),
            ),
          ),
          Center(child: Text('$_favoriteCount')),
        ],
      ),
    ));
  }
}

class Title02layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: Container(
          color: Colors.greenAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均分
            children: <Widget>[
              MyButton(
                Icons.call,
                'Call',
              ),
              MyButton(Icons.share, 'Share'),
              MyButton(Icons.near_me, 'Near'),
            ],
          )),
    );
  }
}

class MyButton extends StatelessWidget {
  IconData icon;
  String msg;
  VoidCallback callback;

  MyButton(
    @required IconData icon,
    @required String msg,
  ) {
    this.icon = icon;
    this.msg = msg;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: Container(
          color: Colors.greenAccent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                this.icon,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  this.msg,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                ),
              )
            ],
          )),
    );
  }
}

class TextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.greenAccent,
      child: Container(
        padding: EdgeInsets.all(32.0),
        child: Text(
          '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
          softWrap: true,
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: Image.asset(
        'images/leak.jpg',
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
