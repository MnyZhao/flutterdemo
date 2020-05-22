/**
 * 子类的创建
 * 子类不会继承父类的无名有参构造函数和命名构造函数(即子类只能继承父类无名、无参数的构造函数)
 * 父类构造函数会在子类的构造函数前调用
 * 默认情况下，子类只能调用父类的无名、无参数的构造函数
 */
class Person1 {
  String name;

  //无参数非命名构造函数
  Person1() {
    print("无参数非命名构造函数");
  }
}

class ChildPerson1 extends Person1 {
  // 因为父类有无参数的，非命名的构造函数，所以可以不用手动调用父类的构造函数
  ChildPerson1.fromDictionary(String data) {
    print('in Son--->' + data);
  }
}

//如果父类不显示提供无名无参的构造函数，在子类中必须手动调用父类的一个构造函数。
// 这种情况下，调用父类的构造函数的代码放在子类构造函数名后，子类构造函数体前，中间使用 : 分隔
class Person {
  String name;

  //有参数非命名构造函数
  Person({String name}) {
    print("有参数非命名构造函数" + name);
  }
}

class ChildPerson extends Person {
  // 父类没有无参数的，非命名的构造函数，所以必须手动调用一个父类的构造函数
  ChildPerson(String msg) : super(name: "111") {
    print(msg);
  }
//  这样写会提示没有默认无参数构造函数 父类没有无参数的所以报错
//  ChildPerson.fromDictionary(Map data) {
//    print('in Son');
//  }
}

//父类中的命名构造函数不能被子类继承。如果想要子类也拥有一个父类一样名字的构造函数，必须在子类中实现这个构造函数
class Pers {
  String name;

  Pers.fromDictionary(Map map) {
    this.name = map["name"];
    print("有参数命名构造函数" + name);
  }
}

class ChildPers extends Pers {
  //fromDictionary 参数可以为任意类型
  ChildPers.fromDictionary(Map map) : super.fromDictionary({"name": "名字"}) {
    print(map['msg']);
  }
}

void main() {
  new ChildPerson1.fromDictionary("test");
  new ChildPerson("msg");
  new ChildPers.fromDictionary({"msg": "222"});
}
