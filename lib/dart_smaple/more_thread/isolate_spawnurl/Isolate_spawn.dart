import 'dart:io';
import 'dart:isolate';

main() async {
  print("main start");
  createIsolate();
  print("main end");
}

Isolate newIsolate;

void createIsolate() async {
  // 两个Isolate要想互相通讯须持有对方的的sendPort
  // 获取mainIsolate的监听器 mainReceivePort
  ReceivePort main_rp = ReceivePort();
  // 获取 mainIsolate 的 SendPort 并作为参数传递给newIsolate
  // 使 newIsolate 持有 mainSendPort，用于通讯
  // 使 newIsolate 可以通过 mainSendPort 将 newIsolate 的发送消息回 mainIsolate
  SendPort main_send = main_rp.sendPort;
  // 创建新的isolate
  newIsolate = await Isolate.spawn(excuter, main_send);
  // 这里需要得到 newIsolate 的 SendPort，
  // 让 mainIsolate 持有 newSendPort，用于通讯
  // 使 mainIsolate 可以通过 newSendPort 将 mainIsolate 的发送消息回 newIsolate
  // 注意 这里 newSendPort 是 newIsolate中的mainSendPort 发送回来的所以要在监听中获取newSendPort
  SendPort new_send;
  //主接收器(mainReceivePort)开始监听newIsolate中的mainSendPort发送回来的消息
  main_rp.listen((message) {
    print("newIsolat通过main_send发送来一条消息 $message ，到mainIsolate");
    if (message[0] == 0) {
      // 获取newSendPort
      new_send = message[1] as SendPort;
    } else {
      new_send?.send("mianIsolate 通过new_send发送了一条消息到newIsolate");
    }
  });
}

// 入口函数将在newIsolate中执行
void excuter(SendPort mainSendPort) {
  // 获取newIsolate的监听器newReceivePort
  ReceivePort new_rp = ReceivePort();
  //newReceivePort开始监听 mainIsolate中的newSendPort发送回来的消息
  new_rp.listen((message) {
    print(message);
    // 接收到第一条main发送过来的函数 就销毁newIsolate
    print("销毁NewIsolate");
    destroyNewIsolate();
  });
  // 获取newIsolate的 SendPort
  SendPort new_send = new_rp.sendPort;
  // 将其发送到 mainIsolate
  // 让 mainIsolate 持有 newSendPort，用于通讯
  // 使 mainIsolate 可以通过 newSendPort 将 mainIsolate 的发送消息回 newIsolate
  mainSendPort.send([0, new_send]);
  // 模拟耗时5秒
  sleep(Duration(seconds: 5));
  mainSendPort.send([1, "excuter 任务完成"]);
  print("NewIsolat 执行结束");
}

//销毁newIsolate
destroyNewIsolate() {
  // 任务执行结束销毁newIsolate
  newIsolate?.kill(priority: Isolate.immediate);
  newIsolate = null;
}
/*
NewIsolat通过main_send发送来一条消息 [0, SendPort] ，到主Isolate
NewIsolat通过main_send发送来一条消息 [1, excuter 任务完成] ，到主Isolate
NewIsolat 执行结束
mian_isolate 通过new_send发送了一条消息到NewIsolate
销毁NewIsolate
*/
