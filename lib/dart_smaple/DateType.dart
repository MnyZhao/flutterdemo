// 数据类型
void main() {
  //num //String　//bool //list集合 //map集合
  //
  //num 是数字类型的父类，有两个子类 int 和 double。
  //
  //int 根据平台的不同，整数值不大于64位。在Dart VM上，值可以从-263到263 - 1，编译成JavaScript的Dart使用JavaScript代码，允许值从-253到253 - 1。
  //
  //double 64位（双精度）浮点数，如IEEE 754标准所规定。
  int a = 1;
  print(a);
  double b = 1.23;
  print(b);
  // String  转换int
  int one = int.parse("1");
  //输出3
  print(one + 2);
  //String 转double
  double two = double.parse("1.1");
  //输出3.1
  print(two + 2);
  //String->int
  String oneAsString = 1.toString();
  //输出1+2
  print("$oneAsString +2 ");
  //输出1 2
  print("$oneAsString 2 ");
  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  // 截取两位小数, 输出3.14
  print(piAsString);

  String aString = 1.12618.toStringAsFixed(2);
  // 检查是否四舍五入，输出1.13，发现会做四舍五入
  print(aString);

  //String
  //Dart里面的String是一系列 UTF-16 代码单元。
  //您可以使用单引号或双引号来创建一个字符串。
  //单引号或者双引号里面嵌套使用引号。
  //用 或{} 来计算字符串中变量的值，需要注意的是如果是表达式需要${表达式}
  String singleString = "abcdddd";
  String doubleString = "abcsdfafd";
  String dsString = '$singleString a "bcsd" ${singleString}';
  String sdString = "abc 'aaa' $dsString";
  print(sdString);
  print(dsString);
  String dString = 'aaa';
  String sString = "bbb";
  // 单引号嵌套双引号
  String dsMsg = '$singleString a "bbb" ${doubleString}';
  // 输出 aaa a "bbb" bbb
  print(dsMsg);

  // 双引号嵌套单引号
  String sdMsg =
      "${singleString.toUpperCase()} abc 'aaa' $doubleString.toUpperCase()";
  // 输出 AAA abc 'aaa' bbb.toUpperCase(),
//  可以看出 ”$doubleString.toUpperCase()“ 没有加“{}“，导致输出结果是”bbb.toUpperCase()“
  print(sdMsg);
  String Msg =
      "${singleString.toUpperCase()} abc 'aaa' ${doubleString.toUpperCase()}";
  print(Msg);

  // bool
  //Dart 是强 bool 类型检查，只有bool 类型的值是true 才被认为是true。
  //只有两个对象具有bool类型：true和false，它们都是编译时常量。
  //Dart的类型安全意味着您不能使用 if（nonbooleanValue） 或 assert（nonbooleanValue） 等代码, 相反Dart使用的是显式的检查值。
  //assert 是语言内置的断言函数，仅在检查模式下有效
  //在开发过程中， 除非条件为真，否则会引发异常。(断言失败则程序立刻终止)。
  // 检查是否为空字符串
  var fullName = '';
  assert(fullName.isEmpty);
  if (fullName.isEmpty) {
    print('fullName null');
  }

  // 检查0
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // 检查是否为null
  var unicorn;
  assert(unicorn == null);

  // 检查是否为NaN
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
  print(iMeantToDoThis);

  //list
  //在Dart中，数组是List对象，因此大多数人只是将它们称为List。
  //注意事项：
  //
  //可以直接打印list包括list的元素，list也是一个对象。但是java必须遍历才能打印list，直接打印是地址值。
  //
  //和java一样list里面的元素必须保持类型一致，不一致就会报错。
  //
  //和java一样list的角标从0开始。
  //
  //如果集合里面有多个相同的元素“X”, 只会删除集合中第一个该元素
  //非元素累固定型List 可以存放多种类型格式数据
  List listMore = new List();
  listMore.add('1'); //String
  listMore.add(1); //int
  listMore.add(1.111); //double
  listMore.add(true); //boolean
  print(listMore);
  //创建一个int类型的list 固定数据类型只能存放固定类型数据
  List intList = new List<int>();

  List list = [10, 7, 23];
  // 输出[10, 7, 23]
  print(list);

  // 使用List的构造函数，也可以添加int参数 比如下面，
//  List testList = new List(10); //长度为10的list集合 表示List固定长度，不能进行添加 删除操作 添加数据会提示Exception :Cannot add to a fixed-length list
//  print("list.length" + testList.length.toString()+testList.toString());
  var fruits = new List();

  // 添加元素
  fruits.add('apples');

  // 添加多个元素
  fruits.addAll(['oranges', 'bananas']);

  List subFruits = ['apples', 'oranges', 'banans'];
  // 添加多个元素
  fruits.addAll(subFruits);

  // 输出： [apples, oranges, bananas, apples, oranges, banans]
  print(fruits);

  // 获取List的长度
  print(fruits.length);

  // 获取第一个元素
  print(fruits.first);

  // 获取元素最后一个元素
  print(fruits.last);

  // 利用索引获取元素
  print(fruits[0]);

  // 查找某个元素的索引号
  print(fruits.indexOf('apples'));

  // 删除指定位置的元素，返回删除的元素
  print(fruits.removeAt(0));

  // 删除指定元素,成功返回true，失败返回false
  // 如果集合里面有多个“apples”, 只会删除集合中第一个改元素
  fruits.remove('apples');

  // 删除最后一个元素，返回删除的元素
  fruits.removeLast();

  // 删除指定范围(索引)元素，含头不含尾
//  fruits.removeRange(start,end);

  // 删除指定条件的元素(这里是元素长度大于6)
  fruits.removeWhere((item) => item.length > 6);

  // 删除所有的元素
  fruits.clear();
  // 可以使用 sort() 函数来排序, 但是由于我们使用定义的数组类型不一样，就不能使用
  var sortList = [1, 2, 4, 5, 3, 6];
  // 根据语法提示： List.sort([(int, int) → int compare]) → void
  sortList.sort((a, b) => a.compareTo(b));
  print(sortList); // 输出[1, 2, 3, 4, 5, 6]
  sortList.sort((a, b) => b.compareTo(a));
  print(sortList); //[6, 5, 4, 3, 2, 1]

//map
//一般来说，map是将键和值相关联的对象。键和值都可以是任何类型的对象。
//每个键只出现一次，但您可以多次使用相同的值。Dart支持map由map文字和map类型提供。
//
  //初始化Map方式一： 直接声明，用{}表示，里面写key和value，每组键值对中间用逗号隔开。
  Map companys = {'Alibaba': '阿里巴巴', 'Tencent': '腾讯', 'baidu': '百度'};
  // 输出：{Alibaba: 阿里巴巴, Tencent: 腾讯, baidu: 百度}
  print(companys);
  //创建Map方式二：先声明，再去赋值。
  Map schoolsMap = new Map();
  schoolsMap['first'] = '清华';
  schoolsMap['second'] = '北大';
  schoolsMap['third'] = '复旦';
  // 打印结果 {first: 清华, second: 北大, third: 复旦}
  print(schoolsMap);

  var fruit = new Map();
  fruit["first"] = "apple";
  fruit["second"] = "banana";
  fruit["fifth"] = "orange";
  //换成双引号,换成var 打印结果 {first: apple, second: banana, fifth: orange}
  print(fruit);

  // map api
  // 指定键值对的参数类型
  var aMap = new Map<int, String>();

// Map的赋值，中括号中是Key，这里可不是数组
  aMap[1] = '小米';

//Map中的键值对是唯一的
//同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  aMap[1] = 'alibaba';

// map里面的value可以相同
  aMap[2] = 'alibaba';

// map里面value可以为空字符串
  aMap[3] = '';

// map里面的value可以为null
  aMap[4] = null;

  print(aMap); //输出{1: alibaba, 2: alibaba, 3: , 4: null}

// 检索Map是否含有某Key
  assert(aMap.containsKey(1));

//删除某个键值对
  aMap.remove(1);

  print(aMap); //输出{2: alibaba, 3: , 4: null}

  // 判断是否为空
  print(aMap.isEmpty); // 输出：false
  print(aMap.isNotEmpty); // 输出：true

  // 获取到所有的 key
  print(aMap.keys); // 输出：(2, 3, 4)

  // 获取到所有的 values
  print(aMap.values); // 输出：(alibaba, , null)

  // 判断是否包含某个key
  print(aMap.containsKey("key")); // 输出：false

  // 判断是否包含某个value
  print(aMap.containsValue("key")); // 输出：false

  // 添加一个新的元素进去
  aMap[4] = 'key';
  print(aMap); // 输出：{2: alibaba, 3: , 4: key}

  // 循环打印 代码提示：Map.forEach((String, String) → void f) → void
  aMap.forEach((key, value) => print('$key:$value')); //2:alibaba 3: 4:key
}
