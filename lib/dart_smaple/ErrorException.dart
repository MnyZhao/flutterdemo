void main() {
  //捕获异常可以使用 on 或 catch 或者同时使用:
  try {
    doubleToInt();
  } on FormatException catch (e) {
    print(e);
  } finally {
    print(double.parse("3.14").toString() + "   ->finally");
  }
//  catch (e) {
//    print(e);
//  }
}

void doubleToInt() {
  int.parse("3.14");
  //抛出的异常可以是任意对象，但最好是 Error 或 Exception 对象:
  throw FormatException('Invalid radix-10 number ');
}
