# 事件处理与通知

> Flutter中的手势系统有两个独立的层。第一层为原始指针(pointer)事件，它描述了屏幕上指针（例如，触摸、鼠标和触控笔）的位置和移动。 第二层为手势，描述由一个或多个指针移动组成的语义动作，如拖动、缩放、双击等。
>
> 这里包括
>
> + [原始指针事件处理](https://book.flutterchina.club/chapter8/listener.html)
> + [手势识别](https://book.flutterchina.club/chapter8/gesture.html)
> + [全局事件总线](https://book.flutterchina.club/chapter8/eventbus.html)
> + [通知Notification](https://book.flutterchina.club/chapter8/notification.html)

## 原始指针事件处理 Pointer

> 各个平台或UI系统的原始指针事件模型基本都是一致，即：一次完整的事件分为三个阶段：手指按下、手指移动、和手指抬起，而更高级别的手势（如点击、双击、拖动等）都是基于这些原始事件的。
>
> ***使用`Listener`来监听原始触摸事件,例如当指针被按下、移动、释放或取消时***

## 手势处理 `GestureDetector`

   + `GestureDetector`内部是使用一个或多个`GestureRecognizer`来识别各种手势的，
     而`GestureRecognizer`的作用就是通过Listener来将原始指针事件转换为语义手势，
     `GestureDetector`直接可以接收一个`子Widget`。`GestureRecognizer`是一个抽象类，
     一种手势的识别器对应一个`GestureRecognizer`的子类，Flutter实现了丰富的手势
     识别器，我们可以直接使用。

