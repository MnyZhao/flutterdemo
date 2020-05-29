void main() {
  String name = "Bob";
  String msg = "Hello '$name' ,How are you";
  String msg2 = 'Hello "${name.toUpperCase()}" ,How are you';
  print(msg);
  print(msg2);
  var msg3='''
  hello Bob
  How are you
  ''';
  print(msg3);
  var s = r"In a raw string, even \n isn't special.";
  print(s);
}
