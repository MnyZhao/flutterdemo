class Person {
  String firstName;
  String country;

  void setCountry(String country) {
    this.country = country;
  }

  Person(firstName) {
    this.firstName = firstName;
  }

  String toString() => 'Name:$firstName\nCountry:$country';
}

void main() {
  print('>>>>>>>>>>>操作符号');
  print(5 / 2); //正常除法
  print(5 ~/ 2); //取整
  print(5 % 2); //取余
  /*判断对象类型用 is 或 is! 操作符，使用 as 操作符进行类型转换:*/
  /**
   * is 表示是
   * is! 表示否
   * as 类型转换
   */
  print('>>>>>>>>>>>>判断类型 类型转换');
  Person person = new Person("name");
  var person1 = Person("name1");
  (person1 as Person).firstName = "BOb"; //如果不是Person类型将会出现异常
  print(person1.firstName);
  if (person is Person) {
    person.firstName = "yes";
    print(person.firstName);
  }
  if (person1 is! Person) {
    print(person1.firstName);
  } else {
    print("NO");
  }
  /*级联符号 可以连续操作属性*/
  /*当你要对一个单一的对象进行一系列的操作的时候*/
  print('>>>>>>>>>>>>级联符号');
  Person p = new Person('test');
  p
    ..firstName = "bob"
    ..setCountry("China");
  print(p);
  /*赋值符号*/
  print('>>>>>>>>>>>>>赋值');
  var b;
  b ??= 'value'; //??=如果b为空则将value 赋值给b;
  print(b);//输出b为value
  print(b ?? 'jack');//?? 如果b为空 则输出jack 否则输出b
  if (b == 'value') {
    print(b == 'value');
  };
  var c;
  var bar='12';
  c?.bar;// ?. 避免左边表达式为空值导致的异常 c不为空返回bar 为空返回null
  print((c?.bar).toString());//输出null


  
  print('>>>>>>>>>>>>>if语句');
  int i = 0;
  if (i < 0) {
    print('i<0');
  } else if (i == 0) {
    print('i==0');
  } else {
    print('i>0');
  }
  print('>>>>>>>>>>>>循环');
  var list = ['s', 'a', 'v', 'e'];
  print('>>>>常规for循环');
  for (int i = 0; i < list.length; i++) {
    print(list[i].toString());
  }
//  element(var f){
//    print(f.toString());
//  }
  print('>>>>forEach');
  element(var f) => print(f.toString());
  list.forEach(element);
  list.forEach((f) => print(f));
  print('>>>>for In');
  for (var params in list) {
    print(params.toString());
  }
  print('>>>>>>>>>>>while');
  int j = 0;
  while (j < list.length) {
    print(list[j].toString());
    j++;
  }
  print('>>>>>>>>>>>DO while');
  int d = 0;
  do {
    print(list[d] + d.toString());
    d++;
  } while (d < list.length);
  /* switch 参数可以是num 或者String*/
  var command = "CLOSE";
  switch (command) {
    case "CLOSE":
      print("CLOSE");
      continue nowClosed; //继续再NowCLosed 标签执行
    nowClosed:
    case "NOW_CLOSED":
      print("now_closed");
      break;
    case "OPEN":
      print("open");
      break;
    default:
  }
}
