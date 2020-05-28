import 'package:meta/meta.dart';

/*程序入口*/

/// 函数
void main() {
  print('>>>>>>>>>>>>>>>函数');
  print(sayHello('Test1'));
  print(sayHelloV(12));
  print(sayHelloL('lambda'));
  print('>>>>>>>>>>>>>>>匿名函数');
  print(sayHelloN('匿名'));
  /*匿名函数*/
  var listN = ['apples', 'banners', 'orange'];
  listN.forEach((item) {
    print('${listN.indexOf(item)}:$item');
  });
  listN.forEach((item) => print('${listN.indexOf(item)}:$item')); //用=>写
  /*is  判断对象是否指定类型*/
  print(sayHello is Function);
  print('>>>>>>>>>>>>>>>语法闭包');
  /**
   * 闭包（closure）就是一个函数对象可以访问它作用域内的变量
   * ，即使这个函数在原始范围外被使用。
   * 例如，下面的例子，subMake() 会捕获 addBy. 无论他返回的函数在哪，他都会记住 addBy:
   *
   */
  var x = subMake(5); //得到subMake方法对象
  print(x(2)); //subMake对象调用里面n-i的方法
  print('>>>>>>>>>>>>>>>将函数作为对象传递给函数');
  /*再dart中任何类型都是对象 函数也是对象*/
  var callbacks = [];
  for (int i = 0; i < 3; i++) {
    //存入一个方法作用是输出save i
    callbacks.add(() => print('save $i'));
  }
  //foreach循环拿到方法 再调用方法
  callbacks.forEach((p) => p()); //用=>写
  callbacks.forEach((p) {
    p();
  }); //正常写法
  /*可以将函数作为对象传递给另外一个函数与上面例子原理相同 将printElemet 传递给foreach*/
  void printElemet(String element) {
    print(element);
  }

  var list1 = ['1', '2', '3'];
  list1.forEach(printElemet);

  print('>>>>>>>>>>>>>>>可选命名参数');
  /*可选命名参数*/
  enableFlags(param1: true, param3: 3);
  enableFlags(param1: true, param2: 'test', param3: 3);
  print('>>>>>>>>>>>>>>>可选位置参数');
  /*可选的位置参数*/
  enableFlags2(true, 'new', 3);
  enableFlags2(true, 'new', 3, 4);
  print('>>>>>>>>>>>>>>>传递list，map作为可选参数');
  /*可传递List map*/
  List<int> list = [4, 5, 6];
  Map<String, String> map = {
    'one': 'param1',
    'two': 'param2',
    'three': 'param3'
  };
  doStuff(list: list, gifts: map);
}

/*函数定义*/
/*没有返回值的时候返回*/
String sayHello(String name) {
  return 'Hello $name';
}

/*因为类型可选(不用指定类型)函数也可以这样写*/
sayHelloV(name) {
  return 'Hello $name';
}

/*函数也可用=> 类似lambda 表达式的写法*/
sayHelloL(name) => 'Hello $name';
/*也可以用来定义匿名函数*/
var sayHelloN = (name) => 'hello $name';
/**
 * Function 函数类型
 * 函数闭包（closure）就是一个函数对象可以访问它词法作用域内的变量
 * ，即使这个函数在原始范围外被使用。
 * 例如，下面的例子，subMake() 会捕获 addBy. 无论他返回的函数在哪，他都会记住 addBy:
 *
 */
Function subMake(num addBy) {
  //返回一个匿名函数
  return (num i) => addBy - i;
}

/**
 * 可选的命名参数调用函数时可以指定命名参数
 * 与顺序无关 在调用函数的时候需要指明参数名
 * 例如paramName:value
 * 定义函数参数时用`{}`包裹
 * {param1,param2...}
 * 可以指定类型 也可以不指定类型
 * 默认值用: 新版本支持 =
 * 没有赋值 值为null
 * @required 为必传参数
 */
void enableFlags({bool param1, String param2 = '2', @required param3}) {
  if (param1) {
    print(param2 + param3.toString());
  }
}

/**
 * 可选的位置参数
 * 参数值依次赋值 与顺序有关
 * 定义函数参数时用`[]`包裹
 * 同样可以指定参数类型也可以不指定参数类型
 * 默认值用=
 * 没有赋值 值为null
 */
void enableFlags2(bool param1, [String param2 = 'Test2', param3, param4]) {
  if (param1 is bool) {
    print(param2 + param3.toString() + param4.toString());
  }
}

//可传递List map 作为可选参数
//const 表示编译时常量 故名思意 只有编译前可以改变值 编译后无法改变
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'secend': 'cotton',
      'third': 'leather'
    }}) {
  print('list: $list');
  print('gifts:$gifts');
}
