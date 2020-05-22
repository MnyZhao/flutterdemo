import 'package:flutterdemo/dart_smaple/model/abstract_interface/Db_Mssql.dart';
import 'package:flutterdemo/dart_smaple/model/abstract_interface/Db_MySql.dart';

void main() {
  Db_Msssql db_msssql=new Db_Msssql();
  db_msssql.add("123");
  db_msssql.delete(3);
  db_msssql.update(1, "345");
  Db_MySql db_mySql=new Db_MySql();
  db_mySql.add("234");
  db_mySql.delete(4);
  db_mySql.update(2, "678");

}
