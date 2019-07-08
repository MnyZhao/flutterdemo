import 'package:flutter/material.dart';

class BaseAppBar {
  String titleMsg;

  BaseAppBar({@required this.titleMsg});

  AppBar getAppBar() {
    return AppBar(
      title: Text('$titleMsg'),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.white,
          onPressed: null,
        );
      }),
    );
  }
}
