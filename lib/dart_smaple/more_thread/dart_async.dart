/**
 * dart 中的异步任务处理
 *
 *  在Dart中可以使用async 和 await 关键字来处理异步任务
 */
void main() {
  task();
}

task() async {
  String entrypoint = await findEntrypoint();
  print(entrypoint);
  //异步例子
  login().then((value) {
    if (value == "name") {
      //登陆名称 是name 则登陆成功
      print("登陆成功");
    }
  });
}

/**
 *
 * 在上面这个 异步函数 中，进行了一个耗时任务 findEntrypoint()，然后调用了 print(entrypoint) 输出耗时任务返回结果。
 *
 * async 关键字是用来标识一个函数是异步函数，该类函数会有一个返回值，其类型为 Future。关于Future请看同目录下的类[dart_future]
    - Future<T> login() async{
    //.....
    }
    - 创建一个异步函数很简单，只需要给函数加个 async 关键字就行。
    - 范型 T 具体是什么，取决于你的异步函数 return 的是什么。

    - 如果没有 return，T 就是 null。

    - 你可以在通过 Future 的 then() 切换到同步中，然后获取返回值。
    - Future<T> login = login();
    - login.then((t){
    //..
    - })
    - 或者，你也可以在异步函数中，通过 await 关键字获取.要使用await，代码必须位于async函数中，该函数被标记为async：
    - await 关键字被用于修饰一个异步函数，它表示逻辑执行到这，需要等待异步函数执行完成，返回结果了才能接着执行。
    - 此时，异步函数（async修饰的函数）的返回值类型就是 Future<T> 中的 T，你无需在从 Future 中获取。
    - Future<String> task(String path) async {
    - String r = await getFileContent(path);
    - return r;
    -  }
    - 通过future的then的方法 拿到返回结果
    - task(path).then((value){
    - print(value); //输出得到的结果
    - })
    --- 上面例子中异步函数 getFileContent() 直接返回了所需的 String 类型结果。

    ⚠注意，await 关键字只能在异步函数中使用，即如果你在一个函数中使用了 await，那这个函数就需要被变为异步函数。
 */
String findEntrypoint() {
  int i = 1;
  while (i < 100) {
    i++;
  }
  return i.toString();
}

Future<String> login() async {
  return await "name";
}
