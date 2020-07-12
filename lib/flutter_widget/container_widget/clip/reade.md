## Flutter中提供了一些剪裁函数，用于对组件进行剪裁。

+ Clip
 - ClipOval	子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
 - ClipRRect	将子组件剪裁为圆角矩形
 - ClipRect	剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
+ CustomClipper
  - 如果我们想剪裁子组件的特定区域