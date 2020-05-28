import 'dart:isolate';

Isolate newIsolate;

main() async {
  /**
   * spawnUri方法有三个必须的参数，
      第一个是Uri，指定一个新Isolate代码文件的路径，
      第二个是参数列表，类型是List<String>，
      第三个是动态消息。
      需要注意，用于运行新Isolate的代码文件中，必须包含一个main函数，
      它是新Isolate的入口方法，该main函数中的args参数列表，
      正对应spawnUri中的第二个参数。如不需要向新Isolate中传参数，该参数可传空List
   */
  ReceivePort mainReceivePort = ReceivePort();
  SendPort mainSendPort = mainReceivePort.sendPort;
  List<String> list = ["hello, isolate", "this is args"];
  var uri = Uri(path: "./newTaskUri.dart");
  // 创建newIsolate 并建立连接
  newIsolate = await Isolate.spawnUri(uri, list, mainSendPort);
  // 需要获取 newSendPort
  // newSendPort 是 newIsolate中的mainSendPort 发送回来的所以要在监听中获取结果
  SendPort newSendPort;
  mainReceivePort.listen((message) {
    print("newIsolat通过main_send发送来一条消息 $message ，到mainIsolate");
    if ("excuter 任务完成" == message[1]) {
      // 销毁newIsolate
      print("销毁newIsolate");
      destroyNewIsolate();

    }
    if (message[0] == 0) {
      // 获取newSendPort
      newSendPort = message[1] as SendPort;
    } else {
      newSendPort?.send("mian_isolate 通过new_send发送了一条消息到newIsolate");
    }
  });
}

//销毁newIsolate
destroyNewIsolate() {
  // 任务执行结束销毁newIsolate
  newIsolate?.kill(priority: Isolate.immediate);
  newIsolate = null;
}
