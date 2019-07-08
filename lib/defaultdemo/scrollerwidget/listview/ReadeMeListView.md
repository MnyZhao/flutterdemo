##ListView
####ListView的构造函数分以下几种
#####默认构造函数 ListView
     默认构造函数有一个children参数，它接受一个Widget列表（List）。这种方式适合只有少量的子widget的情况，因为这种方式需要将所有children都提前创建好（这需要做大量工作），而不是等到子widget真正显示的时候再创建。实际上通过此方式创建的ListView和使用SingleChildScrollView+Column的方式没有本质的区别。下面是一个例子：
     
     ListView(
       shrinkWrap: true, 
       padding: const EdgeInsets.all(20.0),
       children: <Widget>[
         const Text('I\'m dedicating every day to you'),
         const Text('Domestic life was never quite my style'),
         const Text('When you smile, you knock me out, I fall apart'),
         const Text('And I thought I was so smart'),
       ],
     );
     
#### ListView.builder
     ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子Widget真正显示的时候才会被创建。下面看一下ListView.builder的核心参数列表：
     
     ListView.builder({
       // ListView公共参数已省略  
       ...
       @required IndexedWidgetBuilder itemBuilder,
       int itemCount,
       ...
     })
     itemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。当列表滚动到具体的index位置时，会调用该构建器构建列表项。
     itemCount：列表项的数量，如果为null，则为无限列表。
     看一个例子：
     
     ListView.builder(
         itemCount: 100,
         itemExtent: 50.0, //强制高度为50.0
         itemBuilder: (BuildContext context, int index) {
           return ListTile(title: Text("$index"));
         }
     );

####ListView.separated
    ListView.separated可以生成列表项之间的分割器，它除了比ListView.builder多了一个separatorBuilder参数，该参数是一个分割器生成器。下面我们看一个例子：奇数行添加一条蓝色下划线，偶数行添加一条绿色下划线。
    
    class ListView3 extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        //下划线widget预定义以供复用。  
        Widget divider1=Divider(color: Colors.blue,);
        Widget divider2=Divider(color: Colors.green);
        return ListView.separated(
            itemCount: 100,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index%2==0?divider1:divider2;
            },
        );
      }
    }