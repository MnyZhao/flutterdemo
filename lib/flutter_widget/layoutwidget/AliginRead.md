Align 组件可以调整子组件的位置，并且可以根据子组件的宽高来确定自身的的宽高，定义如下：
```dart
Align({
  Key key,
  this.alignment = Alignment.center,
  this.widthFactor,
  this.heightFactor,
  Widget child,
});
```
alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。
AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset，
widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；
它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。
如果值为null，则组件的宽高将会占用尽可能多的空间。

+ Align和Stack对比
  Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，但它们还是有两个主要区别：
  
  定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。
  Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。