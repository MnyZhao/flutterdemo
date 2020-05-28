  * Dart是单线程的，所有代码都运行在某个isolate中。app入口的main函数就是一个isolate。
  * 需要的时候可以使用isolateAPI来创建新的isolate,不同的isolate之间只能通过isolateAPI进行通信。
  * Dart运行环境中靠事件驱动，通过event loop从队列中获取消息。
  * 在一个isolate中有两个队列，event queue和microtask queue
  * app开始运行时，event loop优先处理microtask queue,直到microtask queue为空的时候，再开始处理event queue。
  * event queue不为空的话，一次取一个event执行，执行完后会重新判断microtask是否为空。
  * 因此可以将处理完当前event之后，处理下一个event之前要做的，或者在处理所有event之前要做的事情放在microtask queue中。
  * 注意：绘制和交互等是放在event queue中，所以microtask queue中的任务不可以太耗时，否则会造成卡顿。
  * 当两个queue都为空的时候，app正常退出。
  * Future对象就是一个event，创建Future就会在event queue中添加一条记录，在async await中，被await标记的是一个event。
  * 要使用await，代码必须位于async函数中，该函数被标记为async：
  * Future 提供链式调用 详情见[dart_future.dart]