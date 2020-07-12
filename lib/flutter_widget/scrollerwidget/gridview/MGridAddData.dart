import 'package:flutter/material.dart';

import '../../../utils.dart';

class MGridAddData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MGridAddDataState();
  }
}

class MGridAddDataState extends State<MGridAddData> {
  List<IconData> _icons = []; //保存Icon数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar('GridView.Builder'),
      body: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 1.0),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
