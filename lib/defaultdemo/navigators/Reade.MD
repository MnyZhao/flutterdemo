#### 管理界面之间的跳转

### 路由 Navigator
##### 分为 静态路由 和 动态路由
###### 静态路由在创建时就已经明确知道了要跳转的页面和值。
###### 声明routes 通过Navigator.of(context).pushNamed("/page2"); 方法跳转
        void main() {
          runApp(new MaterialApp(
            home: new MyApp(),
            routes: <String, WidgetBuilder>{
              '/page2': (BuildContext context) => new Page2(textMsg: "My is Page 2",),//传递的值
            },
          ));
        }
        
        class MyApp extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text("Page1"),
              ),
              body: new Center(
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/page2");
                  },
                  child: new Text("点我跳转"),
                  color: Colors.blue,
                  highlightColor: Colors.lightBlue,
                ),
              ),
            );
          }
        }

###### 动态路由，跳转传入的目标地址和要传入的值都可以是动态的。
######  通过push 方法 传递一个routes 对象
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                            (BuildContext context, Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                          return LoginSuccess(userName: username);//传递的值username
                        }));


