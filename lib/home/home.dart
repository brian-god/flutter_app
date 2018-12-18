import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widget/MyBottomNagitionItim.dart';
import 'package:flutter_app/page/homepage.dart';
import 'package:flutter_app/page/Mypage.dart';
import 'package:flutter_app/page/messagepage.dart';
import 'package:flutter_app/page/videopage.dart';
import 'dart:ui';
 class MyHome extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return new MaterialApp(
          home: new _HoneNavigation(),
          /*routes: <String, WidgetBuilder>{
         '/home': (BuildContext context) => new HomePage()
          },*/
        );
    }
 }
 //导航状态组件
 class _HoneNavigation extends StatefulWidget{
   @override
   HoneNavigationState createState() => new HoneNavigationState();
 }
 //导航实现
 class HoneNavigationState extends State<_HoneNavigation>{
    //导航栏的哪一项被选中
    var _isselect = "home";
    PageController pageController;
    int page = 0;
   @override
     void initState() {
       // TODO: implement initState
      super.initState();
      //初始化页面控制类
      pageController = new PageController(initialPage: this.page);
     }
   @override
     Widget build(BuildContext context) {
       // TODO: implement build
       return  new Scaffold(
         body: PageView(
           children: <Widget>[
             HomePage(),
             VideoPage(),
             MessagePage(),
             MyPage(),
           ],
           //页面控制器
           controller: pageController,
           //改变页面的方法
           onPageChanged:onPageChanged, 
         ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /*Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
            }));*/
            setState(() { 
                      //_isselect = "home";     
                  });
          },
          mini: false,
          child:  Container(
                     //child:  Image.asset("statics/images/blog.jpeg",fit:BoxFit.contain,),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(image: AssetImage("statics/images/blog.jpeg"))
                        ),
                        width: 60.0,
                        height: 560.0,
                      ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:BottomAppBar(
          color: Colors.white,
          child: row(),
          notchMargin:6.0,
          shape: CircularNotchedRectangle(),
        ),
      );
     }
    row(){
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              child: IconTextButton(
                key: Key("home"),
                image: _isselect=="home"?"statics/icons/home1.png":"statics/icons/home.png",
                text: "首页",
                tcolor: _isselect=="home"?Colors.blue:Colors.black54,
                onTap: (){
                  setState(() { 
                      _isselect = "home";
                      page = 0;
                      //跳到头条页面
                     // Navigator.of(context).pushReplacementNamed("/home");     
                  });
                  chengepage();
                },
              ),
              height: 50,
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: IconTextButton(
                key: Key("video"),
                image: _isselect=="video"?"statics/icons/video1.png":"statics/icons/video.png",
                text: "视频",
                tcolor:_isselect=="video"?Colors.blue:Colors.black54,
                 onTap: (){
                  setState(() { 
                      _isselect = "video";     
                      page = 1;
                  });
                  chengepage();
                },
              ),
              height: 50,
              margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0)
              ),
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              height: 10,
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: IconTextButton(
                key: Key("message"),
                image: _isselect=="message"?"statics/icons/message1.png":"statics/icons/message.png",
                text: "消息",
                onTap: (){
                  setState(() { 
                      _isselect = "message";
                      page = 2;  
                  });
                  chengepage();
                },
                tcolor: _isselect=="message"?Colors.blue:Colors.black54,
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0)
              ),
               padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: IconTextButton(
                key: Key("my"),
                image: _isselect=="my"?"statics/icons/my1.png":"statics/icons/my.png",
                text: "我的",
                tcolor: _isselect=="my"?Colors.blue:Colors.black54,
                 onTap: (){
                  setState(() { 
                      _isselect = "my"; 
                      page = 3;  
                  });
                  chengepage();
                },
              ),
              height: 50,
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            ),
            flex: 1,
          ),
        ],
      );
    }
    //改变也面的方法
    void chengepage(){
      pageController.animateToPage(
      page, duration: const Duration(milliseconds: 300),
      curve: Curves.ease);
    }
    /** 
     * 改变页面的方法
     */
    void onPageChanged(int page) {
      setState(() {
      this.page = page;
      });
    }
 }