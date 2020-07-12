void main() {
//  String name = "Bob";
////  String msg = "Hello '$name' ,How are you";
////  String msg2 = 'Hello "${name.toUpperCase()}" ,How are you';
////  print(msg);
////  print(msg2);
////  var msg3 = '''
////  hello Bob
////  How are you
////  ''';
////  print(msg3);
////  var s = r"In a raw string, even \n isn't special.";
////  print(s);
  var i = check(2, 1, f: sub);
  print(i);
  Map<String,dynamic> map={'page': '0', 'pageSize': 25, 'type': '同性'};
  print(map);
}

int sub(int x, int y) => x - y;

int check(int x, y, {Function(int x, int y) f}) {
  return f(x, y);
}

