void main() {
  //list
  var listv = [1, 2, 3];
  printv(listv);
  reset(listv);
  Traversing(listv);
  forPrint(listv);
  //map 键值对唯一 value 可以为null 可以为空 value 不唯一
  //第二次输入的Key如果存在，Value会覆盖之前的数据
  Map<String, String> mapv = {
    'key1': 'value1',
    'key2': 'value2',
    'key3': 'value3',
  };
//  mapv.map(((item,int)=>item)
  mapAdd(mapv, "1", "2");
  mapv.forEach((k, v) {
    print(k + v);
  });
//set  无需且唯一 没有固定长度的定义 重复元素无效
//  Set setTest=new Set(3);

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
  print("替换值" + list.toString());
}

/**
 * foreach 输出
 */
void printv(List list) {
  list.forEach((dynamic i) => print(i));
  list.forEach((i) {
    print(i);
  });
  print("foreach输出");
}

/**
 * 循环遍历  list  set 均实现了Iterator map可以根据key 和value 获取Iterable
 */
void Traversing(List list) {
  Iterator it = list.iterator;
  while (it.moveNext()) {
    print(it.current);
  }
  print("循环遍历List");
}

void forPrint(List list) {
  for (int i = 0; i < list.length; i++) {
    print(list[i].toString() + "for 循环输出");
  }
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
  Iterator itValues = map.values.toList().iterator;
  while (itValues.moveNext()) {
    print(itValues.current);
  }
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
  se.forEach((i){
    print(i);
  });
}
