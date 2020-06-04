import 'package:flutter/material.dart';

import 'page_transformer.dart';

class PagerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PagerViewState();
  }
}

class PagerViewState extends State<PagerView> {
  List<String> _list = ["Main", "Secend", "Thred"];
  List<String> _msg = [
    "Helo I am Main My is first pager",
    "Hi I am Secend My is two pager",
    "Hey I am Secend My is Three pager"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageTransformer(pageViewBuilder: (context, pageVisibilityResolver) {
      return PageView.builder(
        onPageChanged: (index) {
        },
        itemCount: _list.length,
        controller: PageController(initialPage: 0, viewportFraction: 0.9),
        itemBuilder: (context, index) {
          return PageItem(
            pageVisibility: pageVisibilityResolver.resolvePageVisibility(index),
            title: _list[index],
            msg: _msg[index],
          );
        },
      );
    });
  }
}

class PageItem extends StatefulWidget {
  String title;
  String msg;
  PageVisibility pageVisibility;

  PageItem({this.title, this.msg, this.pageVisibility});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageItemState();
  }
}

class PageItemState extends State<PageItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(
              'images/place_holder_2.jpg',
              fit: BoxFit.cover,
              alignment: FractionalOffset(
                0.5 + (widget.pageVisibility.pagePosition / 3),
                0.5,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
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
          ),
          _getTxtAnimation(),
        ],
      ),
    );
  }

  Widget _getTransTxt(
      {@required double translationFactor, @required String msg}) {
    //透明度的变化
    final double xTranslation =
        widget.pageVisibility.pagePosition * translationFactor;
    print("position" + widget.pageVisibility.pagePosition.toString());
    return Opacity(
      opacity: widget.pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(xTranslation, 0.0, 0.0),
        child: Text(
          msg,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white70),
          textAlign: TextAlign.center,
        ),
      ),
      /* */
    );
  }

  Widget _getTxtAnimation() {
    return Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getTransTxt(translationFactor: 200, msg: widget.title),
          Padding(
            padding: EdgeInsets.only(top: 17),
            child: _getTransTxt(translationFactor: 200, msg: widget.msg),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: PagerView(),
    ),
  ));
}
