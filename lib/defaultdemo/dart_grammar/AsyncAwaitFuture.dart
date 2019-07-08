


void main() {
//  easySmaple();
//  futureSmaple();
  ansyAwaitSmaple();
}

/*
* 示例代码 不带异步  
*从逻辑来看我们确实是先进入了餐馆，然后等待菜来，等的期间开始了聊天和玩手机。
*但是因为Dart是单线程的所以无论你等待饭来的时间多长，在这个操作没有完成之前他
* 都不会去执行下面的操作，这样就不美好了啊，我在等吃饭的时间内什么也做不了了啊。
*上面的例子就是非异步操作引起的问题。在Flutter要想解决上面的问题可以借助于Future来解决这个问题
*/
void easySmaple() {
  print(enterRestaurant()); //进入餐馆
  print(waitForDinner()); //等待吃饭
  print(startChat()); //开始聊天
  print(playPhone()); //玩手机
  print('从逻辑来看我们确实是先进入了餐馆，然后等待菜来，等的期间开始了聊天和玩手机'
      '但是因为Dart是单线程的所以无论你等待饭来的时间多长，在这个操作没有完成之前他'
      '都不会去执行下面的操作，这样就不美好了啊，我在等吃饭的时间内什么也做不了了啊。'
      '上面的例子就是非异步操作引起的问题。在Flutter要想解决上面的问题可以借助于Future来解决这个问题');
}

String enterRestaurant() {
  return "和朋友进入了一家餐馆";
}

String waitForDinner() {
  return "我们的菜来了，我要开始吃饭了";
}

String startChat() {
  return "我们朋友聊起家常";
}

String playPhone() {
  return "等了好好久了，我还是玩会手机吧";
}

///*[Future] 什么是future
///Future是在未来某个时间获得想要对象的一种手段。

///当调用Future后系统会将使用Future的操作放入一个队列中去排队执行，
///并返回一个未完成的Future对象，当事件完成后或者有一个可用的值时Future就会调用自己的then回调让调用者去处理这个对象。
///在Flutter中我们可以使用如下两种方式来获取Future。
///1.使用Future APi
///2.使用async和await (Dart1.9后支持)

void futureSmaple() {
  print(enterRestaurant()); //进入餐馆
  Future<String> waitForDinnerFuture = Future(waitForDinner);
  waitForDinnerFuture.then((onValue) {
    print(onValue);
  });
//  print(waitForDinner()); //菜上来了 等待吃饭
  print(startChat()); //开始聊天
  print(playPhone()); //玩手机
}

///首先我们需要使用async来修饰需要异步处理的方法上，
/// 然后使用await来修饰需要异步操作的地方，然后 这个函数就可以返回一个Future对象了。
Future<String> waitForDinnerAsync() async {
  return await "我们的菜来了，我要开始吃饭了";
  ;
}

void ansyAwaitSmaple() {
  print(enterRestaurant()); //进入餐馆
  print(waitForDinnerAsync()
      .then((value) {
        print(value);
      })
      .catchError((onError) {})
      .whenComplete(() {
        print("over");
        print('ansyAwait Smaple run over');
      })
      .timeout(Duration(microseconds: 30))); //菜上来了 等待吃饭

  print(startChat()); //开始聊天
  print(playPhone()); //玩手机
}
