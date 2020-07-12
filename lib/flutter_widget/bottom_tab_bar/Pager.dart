import 'package:flutter/material.dart';

class Pager extends StatelessWidget {
  var msg;

  Pager(this.msg);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("$msg",style: TextStyle(color: Colors.green,fontSize: 40.0),),
    );
  }

}