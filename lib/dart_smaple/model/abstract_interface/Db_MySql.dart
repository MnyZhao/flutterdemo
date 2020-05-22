import 'package:flutterdemo/dart_smaple/model/abstract_interface/Db_Abstrac.dart';

class Db_MySql implements Db_Abstract {
  @override
  void add(String msg) {
    // TODO: implement add
    print("添加数据 $msg");
  }

  @override
  void delete(int id) {
    // TODO: implement delete
    print("删除数据 $id");
  }

  @override
  void update(int id, String msg) {
    // TODO: implement update
    print("更新数据id $id 更新数据信息 $msg");
  }
}
