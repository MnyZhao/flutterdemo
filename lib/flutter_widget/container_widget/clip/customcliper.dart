import 'package:flutter/material.dart';

import '../../../utils.dart';


/*
 * 如果我们想剪裁子组件的特定区域，
 * 比如，在上面示例的图片中，如果我们只想截取图片中部40×30像素的范围应该怎么做？
 *  这时我们可以使用CustomClipper来自定义剪裁区域，实现代码如下：
 *  首先，自定义一个CustomClipper：
 */
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

/*
* getClip()是用于获取剪裁区域的接口，由于图片大小是60×60，
* 我们返回剪裁区域为Rect.fromLTWH(10.0, 15.0, 40.0, 30.0)，即图片中部40×30像素的范围。
* shouldReclip() 接口决定是否重新剪裁。如果在应用中，
* 剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
* 如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁。
* 然后，我们通过ClipRect来执行剪裁，为了看清图片实际所占用的位置，我们设置一个红色背景：
*/
class ClipperSample extends StatelessWidget {
  Widget avatar = Image.asset('images/avatar.jpg', width: 60.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar("CustomClipper"),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: ClipRect(
            clipper: MyClipper(), //使用自定义的clipper
            child: avatar),
      ),
    );
  }
}
