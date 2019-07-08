void main() {
  //list
  var listv = [1, 2, 3];
  printv(listv);
  reset(listv);
  Traversing(listv);
  //map
  Map<String, String> mapv = {
    'key1': 'value1',
    'key2': 'value2',
    'key3': 'value3',
  };
  mapAdd(mapv, "1", "2");
  mapv.forEach((k,v){
    print(k+v);
  });
//set
  Set setv = new Set();
  setv.add(1);
  setv.add(2);
  setv.add(3);
  setv.add(4);
  setv.add(5);
  setv.add(6);

  setAdd(8, setv);
}

/**
 *替换第一个数据
 */
void reset(List list) {
  var list1 = [6];
  list.setRange(0, 1, list1); //通过Iterable更换
  list.forEach((dynamic i) => print(i));
  list.removeAt(0); //先移除
  list.insert(0, 10); //再插入想更换的值
  print("替换值");
}

/**
 * foreach 输出
 */
void printv(List list) {
  list.forEach((dynamic i) => print(i));
  print("foreach输出");
}

/**
 * 循环遍历  list map set 均实现了Iterator
 */
void Traversing(List list) {
  Iterator it = list.iterator;
  while (it.moveNext()) {
    print(it.current);
  }
  print("循环遍历List");
}

/**
 * map 集合遍历 根据key
 */
void mapTraver(Map map) {
  Iterator itKeys = map.keys.toList().iterator;
  while (itKeys.moveNext()) {
    print(map[itKeys.current]);
  }
  print("循环遍历Map");
}

/**
 * map集合添加数据
 */
void mapAdd(Map map, String key, String value) {
  List<MapEntry<String, String>> list = new List();
  list.add(MapEntry(key, value));
  list.add(MapEntry("keyadd", "valueAdd"));
  map.addEntries(list.reversed); //通过Iterable增加数据
  mapTraver(map);
}

/**
 * set 集合添加数据
 */
void setAdd(var i, Set se) {
  se.add(i);
  Iterator it = se.iterator;
  while (it.moveNext()) {
    print(it.current);
  }
}
