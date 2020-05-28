//main() {
//  TestFun testFun = TestFun(fun);
//  // 通过func判断
//  print(testFun.f is func);
//  print(testFun.f is func1);
//}
//
//// 定义一个返回值为int 的函数 fun
//int fun(Object a, Object b) => 0;
//// 给函数传递a b 返回int 的函数定义别名 func
//// 方式一 别名 后面只能是 Funcation
//typedef func = int Function(Object a, Object b);
//// 方式二 函数名就是别名
//typedef int func1(Object a, Object b);
//
//class TestFun {
//  var f;
//  TestFun(int fun(Object a, Object b)) {
//    f = fun;
//  }
//}
//方式一 别名 后面只能是 Funcation
typedef Compare<T> = int Function(T a, T b);
//方式二 函数名就是别名
typedef int Compare1<T>(T a, T b);
int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
  assert(sort is Compare1<int>); // True!
}
