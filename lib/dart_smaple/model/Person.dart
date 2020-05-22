/*dart 类*/
class Person {
  String name;
  int age;

  //默认构造函数 如果要添加参数则需要 写下面的命名构造函数
  //和java区别在于 Dart只有不带参数默认构造函数和带参数默认构造函数 命名构造函数
  // 同时存在只能是默认构造函数和命名构造函数 or 带参数构造函数与命名构造函数
  // 带参数构造与默认不带参数构造不能并存
  //java 构造函数可以同名不同参数共存
  /**
   * Dart
   * class Perosn{
   *  String name;
   *  //默认构造函数
   *  Person(){}
   *  //命名构造函数
   *  Person.fromDictionary(String name){
   *    this.name=name;
   *  }
   * }
   */ //  Person(){}
  //构造函数 常规写法
//  Person(String name, int age) {
//    this.name = name;
//    this.age = age;
//  }

  //构造函数  简化写法
//  Person(String this.name, int this.age);

  // 命名构造函数 fromDictionary 括号中可以为任意类型
  Person.fromDictionary(Map dic) {
    this.age = dic["age"];
    this.name = dic["name"];
  }
}

//静态构造函数(单例)
//如果想要让类产生一个永远不会改变的对象，可以让这些对象成为编译时常量。为此，需要定义一个 const 构造函数并确保所有的实例变量都是 final 的
class ImmutablePoint {
  final num x;
  final num y;

  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

//.重定向构造函数
//有时候构造函数的目的只是重定向到该类的另一个构造函数。重定向构造函数没有函数体，使用冒号:分隔
class Point {
  num x;
  num y;

  // 主构造函数
  Point(this.x, this.y) {
    print("Point($x, $y)");
  }

  // 重定向构造函数，指向主构造函数，函数体为空
  // 貌似swift中的便利构造函数，但略有不同
  Point.alongXAxis(num x) : this(x, 0);
}

void main() {
  new Person.fromDictionary({'age': 10, "name": "sss"});
  new ImmutablePoint(1, 2);
  new Point.alongXAxis(12);
}
