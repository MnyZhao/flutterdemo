
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';

class paddingSample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("Padding"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
//            padding: EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),
            padding: EdgeInsets.all(10),
            child: Text("padding"),
          )
        ],
      ),
    );
  }

}