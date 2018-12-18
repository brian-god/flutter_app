import 'package:flutter/material.dart';
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
    _tabController = new TabController(length: 4, vsync: this);
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TabBar"),
          elevation: 0.7,
          bottom: new TabBar(
            controller: _tabController,
            indicator: new UnderlineTabIndicator(),
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.camera_alt),
              ),
              new Tab(
                text: "CHATS",
              ),
              new Tab(
                text: "STATUS",
              ),
              new Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: new TabBarView(controller: _tabController, children: <Widget>[
          new Center(),
          new Center(),
          new Center(),
          new Center(),
        ]));
  }
}
