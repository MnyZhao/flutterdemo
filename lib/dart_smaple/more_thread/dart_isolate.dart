import 'dart:isolate';

import 'package:flutter/foundation.dart';

/**
 *  创建isolate并与当前主isolate建立连接
 *  因为isolate之间不共享内存且通过消息交互
 *  每个isolate 都暴露一个将消息传递给isolate的端口(sendPort)
 *   源码中对sendport 这样描述
 *   [SendPort]s are created from [ReceivePort]s.（发送端口是从接收端口创建的）
 *   对[ReciverPort]这样描述
 *   Together with SendPort, the only means of communication between isolates.
 *   与发送端一起，是一种isolate之间的通讯方式
 *   所以接收端口具备收发的功能 是一个接收/发送的端口
 *   这以为着主Isolate 和新的isolate 要互相知道彼此的端口才能通讯
 */

// 新的 isolate 端口 该端口将在未来使用 用来给 isolate 发送消息
SendPort newIsolateSendPort;
// 新 Isolate 实例
Isolate newIsolate;
void main(){
  startIsolate();
  sendReceive("123");
}
// 初始化一个新的isolate并简历连接
void startIsolate() async {
  // 本地临时的recivePort
  // 用来检索新的isolate的sendport
  ReceivePort receivePort = ReceivePort();

  // 初始化isolate
  // 可以看到每一个isolate 需要一个入口点 entryPoint
  // isolate 的「入口」必须是顶级函数或静态方法。
  // 参数[entryPoint]指定要在派生的隔离中调用的初始函数。
  //入口点函数在新的Isolate中被调用，只有[message]作为参数。
  newIsolate = await Isolate.spawn(
    callbackFunction,
    receivePort.sendPort,
  );
  //检索要用于进一步通信的端口
  newIsolateSendPort = await receivePort.first;
}

void callbackFunction(SendPort callerSendPort) {
  // 初始化一个 SendPort 来接收来自调用者的消息
  ReceivePort newIsolateReceivePort = ReceivePort();
  // 向调用者提供该 isolate 的 SendPort 引用
  callerSendPort.send(newIsolateReceivePort.sendPort);
  // 监听输入报文、处理并提供回复的
  // Isolate 主程序
  newIsolateReceivePort.listen((dynamic message) {
    CrossIsolatesMessage incomingMessage = message as CrossIsolatesMessage;
    // 处理消息
    String newMessage = "complemented string " + incomingMessage.message;
    // 发送处理的结果
    incomingMessage.sender.send(newMessage);
  });
}

// 向新 isolate 发送消息并接收回复的方法
// 在该例中，我将使用字符串进行通信操作
// （发送和接收的数据）
Future<String> sendReceive(String messageToBeSent) async {
  // 创建一个临时端口来接收回复
  ReceivePort port = ReceivePort();

  //
  // 发送消息到 Isolate，并且
  // 通知该 isolate 哪个端口是用来提供
  // 回复的
  //
  newIsolateSendPort.send(CrossIsolatesMessage<String>(
    sender: port.sendPort,
    message: messageToBeSent,
  ));

  //
  // 等待回复并返回
  //
  return port.first;
}

//
// 帮助类
//
class CrossIsolatesMessage<T> {
  final SendPort sender;
  final T message;

  CrossIsolatesMessage({
    @required this.sender,
    this.message,
  });
}
