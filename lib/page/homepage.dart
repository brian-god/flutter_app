import 'package:flutter/material.dart';
import 'package:flutter_app/page/homeItme/newsItem.dart';
class HomePage extends StatelessWidget {


 @override
 Widget build(BuildContext context) {
  // TODO: implement build
    return  TabNavigation();
 }
}

class TabNavigation extends StatefulWidget{
  @override
  TabNavigationState createState () => new TabNavigationState();
}

class TabNavigationState extends State<TabNavigation>
  with SingleTickerProviderStateMixin {
  var _tabController;
 
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 6, vsync: this);
  }
  final mytabs = [
    //头条，社会，国内，娱乐，体育，军事，科技，财经，时尚
     new Tab(text: "头条",),
     new Tab(text: "社会",),
     new Tab(text: "国内",),
     new Tab(text: "娱乐",),
     new Tab(text: "体育",),
     new Tab(text: "...",),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
            child: new AppBar(
              backgroundColor: Colors.red,
              bottom:	new TabBar(
                  controller: _tabController,
                  indicator: new UnderlineTabIndicator(),
                  //子组件
                  tabs: mytabs,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                ),
          ),
          preferredSize:Size.fromHeight(48.0),
        ),
        body: new TabBarView(controller: _tabController, children: <Widget>[
          new NewsiItme(type: 'top',),
          new NewsiItme(type: 'shehui',),
          new NewsiItme(type: 'guonei',),
          new NewsiItme(type: 'yule',),
          new NewsiItme(type: 'tiyu',),
          new Center(),
        ]));
  }
}
