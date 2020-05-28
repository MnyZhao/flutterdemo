import 'dart:async';

class dart_future {}

/**
 *  定义
    -  Future 是在未来某个时间获得想要对象的一种手段。dart 提供的一种异步方案
    -  Future 内的执行函数被放到event队列中
    -  简单来说，就是我们能够通过它在某个时间点获得异步任务中返回的值。
    -  实际上，就是给 Future 设置回调函数，当异步任务执行完成后，会调用回调函数。
    - 例子 本dart文件搜所login
    - 当异步的 login 任务执行完成后，回调用 then() 中的回调函数。
 *  Future对象就是一个event，创建Future就会在event queue中添加一条记录，在async await中，被await标记的是一个event。
 */
void main() async {
  print(await login());
  login().then((value) {
    print(value);
  }).catchError((e) {
    print(e);
  });
  print("hello");

  /**
   * Dart运行环境中靠事件驱动，通过event loop从队列中获取消息。在一个isolate中有两个队列，event queue和microtask queue
   * app开始运行时，event loop优先处理microtask queue,直到microtask queue为空的时候，再开始处理event queue。event queue不为空的话，
   * 一次取一个event执行，执行完后会重新判断microtask是否为空。
   * 因此可以将处理完当前event之后，处理下一个event之前要做的，或者在处理所有event之前要做的事情放在microtask queue中。
   * 注意：绘制和交互等是放在event queue中，所以microtask queue中的任务不可以太耗时，否则会造成卡顿。
   * 当两个queue都为空的时候，app正常退出。
   * Future 是evnet 队列处理的
   */
  new Future(() {
    print("1");
  });
  Future.microtask(() {
    print('microtask1 可以看出 先运行microtask 对列中的消息');
  });
  new Future(() {
    print("3");
  });
  Future.microtask(() {
    print('microtask2 可以看出 先运行microtask 对列中的消息');
  });
  /**
   * Future 的常用函数
      -   Future.then()任务执行完成会进入这里，能够获得返回的执行结果。
      -   Future.catchError()有任务执行失败，可以在这里捕获异常。
      -   Future.whenComplete()当任务停止时，最后会执行这里。
      -   Future.wait()可以等待多个异步任务执行完成后，再调用 then()。只有有一个执行失败，就会进入 catchError()。
      -   Future.delayed()延迟执行一个延时任务。
   */
  Future.wait([
    // 2秒后返回结果
    Future.delayed(Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(Duration(seconds: 4), () {
      return " world ";
    })
  ]).then((listValue) {
    //执行成功会走到这里
    print(listValue[0] + listValue[1]);
  }).catchError((e) {
    //执行失败会走到这里
  }).whenComplete(() {
    //无论成功或失败都会走到这里
    print("执行结束");
  });
  Future.delayed(Duration(seconds: 2), () {
    return "hello";
  }).then((e) {
    print(e);
  });
}

//在async await中，被await后面表达式的值通常是一个Future对象。
//**async 和await 并没有执行异步操作 真是实现异步的还是future ，
// async 和await 只是一组可以省略调用futureApi的关键字，可以让程序看起来更简洁
Future<String> login() async {
  return Future<String>(() {
    return "test async await";
  });
}
