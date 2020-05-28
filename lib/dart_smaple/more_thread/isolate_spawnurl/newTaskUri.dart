import 'dart:io';
import 'dart:isolate';

// 这里的main 就是入口函数 在newIsolate中执行
// 就相当与 spawn中的 excuter
// 内部执行回传sendport，消息监听发送，逻辑是一样的
// 区别就是多了一个参数列表可以传一些参数处理些逻辑 功能更丰富了
void main(args, SendPort mainSendPort) {
    print("newIsolate 开始");
    print("newIsolate (参数列表)args: $args");

    ReceivePort newRecivePort = new ReceivePort();
    //newReceivePort开始监听 newSendPort发送回来的消息
    newRecivePort.listen((message) {
      print(message);
      // 接收到第一条消息
    });
    // 获取newSendPort 并通过mainSendPort 回传到mainIsolate
    SendPort newSendPort = newRecivePort.sendPort;
    mainSendPort.send([0, newSendPort]);
    // 模拟耗时5秒
    sleep(Duration(seconds: 5));
    mainSendPort.send([1, "excuter 任务完成"]);
    print("NewIsolat 执行结束");
}
