import 'package:flutter/material.dart';

class MDHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserAccountsDrawerHeader(
      accountName: new Text('Tom'),
      accountEmail: new Text('tom@xxx.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage('images/leak.jpg'),
        radius: 35.0,
      ),
    );
  }
}

class MHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        //层叠布局用来放背景图
        children: <Widget>[
          /*Image.asset(
            'images/leak.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),*/
          Align(//它可以将其子widget对齐，并可以根据子widget的大小自动调整大小。
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: Image.asset(
                      "images/leak.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Center(
                    child: Text('Name'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MDHeader(),
//          MHeader(),
          Column(
            children: <Widget>[
              ListTile(
                onTap: () => print('click Add'),
                leading: Icon(Icons.add),
                title: Text('Add'),
              ),
              ListTile(
                onTap: () => print('click Add'),
                leading: Icon(Icons.add),
                title: Text('Add'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

void main() {
  runApp(MaterialApp(
    home: MaterialUI(),
  ));
}

class MaterialUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MaterialState();
  }
}

class MaterialState extends State<MaterialUI> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> listBot = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(
        icon: Icon(Icons.business), title: Text('Business')),
    BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
  ];
  var _bodys = [
    MsgPage(
      msg: 'Home',
    ),
    MTabBar(msg: 'Businese'),
    MsgPage(
      msg: 'School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _bodys[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: listBot,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class MsgPage extends StatelessWidget {
  MsgPage({@required this.msg});

  String msg;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Material UI'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Text('$msg'),
    );
  }
}

class MTabBar extends StatefulWidget {
  MTabBar({@required this.msg});

  String msg;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MTabBarState(msg: msg);
  }
}

class MTabBarState extends State<MTabBar> {
  MTabBarState({@required this.msg});

  String msg;
  List<Tab> listTab = <Tab>[
    Tab(text: '湛卢'),
    Tab(text: '鱼肠'),
    Tab(text: '承影'),
    Tab(text: '巨阙')
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: listTab.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar $msg'),
            bottom: TabBar(
              tabs: listTab,
              isScrollable: true,
              indicatorColor: Colors.red,
              labelColor: Colors.white,
            ),
          ),
          body: TabBarView(
              children: listTab
                  .map((Tab tab) => Center(child: Text(tab.text)))
                  .toList())),
    );
  }
}
