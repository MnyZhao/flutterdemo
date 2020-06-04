import 'package:flutter/material.dart';
import 'package:flutterdemo/defaultdemo/base/BaseAppbar.dart';
import 'package:flutterdemo/utils.dart';

/**
 * 弹性布局
 * 弹性布局允许子widget按照一定比例来分配父容器空间，弹性布局的概念在其UI系统中也都存在
 * ，如H5中的弹性盒子布局，Android中的FlexboxLayout。
 * Flutter中的弹性布局主要通过Flex和Expanded来配合实现。二者结合可分配权重
 * flex 分配剩余空间
 *
 */
class Flexs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        //Column垂直方向按照30.0像素  1 :1  100像素来分配
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.black,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.greenAccent,
                )),
          ],
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.purpleAccent,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.lightBlueAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: SizedBox(
            height: 100.0,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                //Spacer创建一个可调整的空间隔，可用于调整Flex容器（如行或列）中窗口小部件之间的间距。
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Spacer(
                  flex: 1 % 2,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Flexss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar('FlexExpanded'),
      body: Flexs(),
    );
  }
}
