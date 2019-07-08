/// dart
void main() {
  // 单行注释 用这个标记
  /// 文档注释 用这个标记 会生成对应的html文档 具体还没看到过
  ///
  /*也是指这种注释 只适合注释暂时不用的代码*/

  /// 变量
  ///dart  可以赋值给变量的都是对象 包括数字 函数 和null 对象 对象都是类的实例
  /// 都继承自 object
  /// 变量存的是引用
  /// 虽然dart语言是强类型语言 但是类型声明是可选的，Dart可以自己推断出变量是什么类型
  /// 可以用var 关键字声明变量 不用指定具体类型
  var name = 1;
  var name1 = "111";
  //is 表示比较判断
  print(name is num);
  print(name1 is String);

  /// dart中分两种类型 object dynamic ;object 适合表示任何对象场景 dynamic 适合复杂类型
  /// var 声明变量后不可改变数据类型 var str1='name'; str1=1000;这样是错误的
  /// dynamic 声明变量后可以改变数据类型 Dynamic str1='name'; str1=1000;这样是正确的
  /// 就是说当Dart 的类型系统已经不足以表示一些列允许的类型 或者值 来自interop 或者
  /// 其他超过类型系统范围的类型 或者你想明确的声明运行时动态处理的变量
  void log(Object object) {
    print(object.toString());
  }

  bool convertTobool(dynamic arg) {
    if (arg is bool) return true;
    if (arg is String) return true;
  }

  ///  在声明变量的时候，除了var，还可以使用const和final
  ///  同时，在使用const和final的时候，可以省略var或者其他类型

  /// var i = 10；
  ///  const i = 10；
  ///  final i = 10；

  ///  int i = 10；
  ///  const int i = 10；
  ///  final int i = 10；
  ///  const和final定义的都是常量，值不能改变
  ///  并且在声明的时候就必须初始化
  ///  但是也有细微差别，简单来说

  ///  const定义的是编译时常量，只能用编译时常量来初始化
  ///  final定义的常量可以用变量来初始化
  ///  final time = new DateTime.now(); //Ok
  ///  const time = new DateTime.now(); //Error，new DateTime.now()不是const常量

  final timef = new DateTime.now();
//  const timec = new DateTime.now();
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];
  list.forEach(printElement);
  var callbacks = [];
  for (int i = 0; i < 3; i++) {
    //存入一个方法作用是输出save i
    callbacks.add(() => print('save $i'));
  }
  callbacks.forEach((a) => a());
  var a = 10;
  if (a is int) {
    print('main' + "true");
  }
  String str1 = 'my'
      'is'
      "your father";
  String str2 = r"safdasdf";
  print(str1 + "\n" + str2);
  var list1=new List();
  list1.add(1);
  list1.add(2);
  list1.add(3);
  list1.add(4);
  list1.add(5);

  Iterator it=list1.iterator;
  while(it.moveNext()){
//      print(it.current);
  }
  print(1 % 2);
}
