void main() {
  //dynamic
  dynamic mic = "hello world";//编译时不会揣测数据类型，但是运行时会推断
  print(mic.runtimeType);//String
  print(mic);//hello world
  //但是这样的坏处就是会让dart的语法检查失效，所以有可能会造成混乱而不报错
  //所以不要直接使用dynamic
  mic.foo();
  //通过它定义的变量会关闭类型检查,这段代码静态类型检查不会报错，但是运行时会crash，因为mic并没有foo（）方法，
  // 所以建议大家在编程时不要直接使用dynamic
  mic=1;
  print(mic.runtimeType);//int 说明类型是可变的
  print(mic);//1

  //Object
  Object object = "hello world";
  print(object.runtimeType);//String
  print(object);//hello world
  object=1;
  print(object.runtimeType);//int 说明类型是可变的
  print(object);//1
  //object.foo();静态类型检查会运行报错会报错
}

