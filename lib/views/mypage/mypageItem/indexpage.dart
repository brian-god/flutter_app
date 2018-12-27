import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/IconTextButton.dart';
import 'package:flutter_app/widgets/LonButton.dart';
class IndexPage extends StatelessWidget {


 @override
 Widget build(BuildContext context) {
  // TODO: implement build
    return  IndexPageStateful();
 }
}

class IndexPageStateful extends StatefulWidget{
  @override
  IndexPageState createState () => new IndexPageState();
}

class IndexPageState extends State<IndexPageStateful>{
 
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var _act =1;
    return new Scaffold(
      body: Container(
        color: Colors.grey[300],
        //竖向布局
        child: Column(
            children: <Widget>[
              //头像
                Container(
                  color: Colors.white,
                  height: 150,
                  child: Center(
                    child: new ClipOval(
                        child: Image.asset("statics/images/blog.jpeg",fit:BoxFit.fill,width: 110,height: 110,),
                      ),
                    ),
                  //width: 500,
                ), 
                //记录菜单
                Container(
                  color: Colors.white,
                  height: 65,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Row(
                     mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: IconTextButton(
                            image: "statics/icons/shouchang.png",
                            text: "我的收藏",
                            tcolor: Colors.black,
                            fontSize: 12,
                            iconHeight: 25,
                            iconWidth: 25,
                            iconMarage: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Center(
                           child: IconTextButton(
                            image: "statics/icons/pinglu.png",
                            text: "我的评论",
                            tcolor: Colors.black,
                            fontSize: 12,
                            iconHeight: 25,
                            iconWidth: 25,
                            iconMarage: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Center(
                           child: IconTextButton(
                            image: "statics/icons/zan.png",
                            text: "我的点赞",
                            tcolor: Colors.black,
                            fontSize: 12,
                            iconHeight: 20,
                            iconWidth: 20,
                            iconMarage: EdgeInsets.fromLTRB(0, 6, 0, 2),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Center(
                           child: IconTextButton(
                            image: "statics/icons/jili.png",
                            text: "浏览记录",
                            tcolor: Colors.black,
                            fontSize: 12,
                            iconHeight: 20,
                            iconWidth: 20,
                            iconMarage: EdgeInsets.fromLTRB(0, 6, 0, 2),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  )
                  //width: 500,
                ), 
                Container(
                  color: Colors.white,
                  height: 134,
                  child: Column(
                    children: <Widget>[
                      LongButton(
                        //color: Colors.blue,
                        height: 45,
                        leftWight: Container(
                          child: Text("我的关注",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                          margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.8))
                        ),
                      ),
                      LongButton(
                        //color: Colors.blue,
                        height: 44,
                        leftWight: Container(
                          child: Text("消息通知",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                          margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.8))
                        ),
                      ),
                      LongButton(
                        //color: Colors.blue,
                        height: 45,
                        leftWight: Container(
                          child: Text("阅读公益",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text('今日阅读39分钟',style: TextStyle(color: Colors.grey[300]),),
                                margin: EdgeInsets.fromLTRB(8, 13, 3, 13),
                              ),
                              Container(
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                                margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ), 
                Container(
                  color: Colors.white,
                  height: 134,
                  child: Column(
                    children: <Widget>[
                      LongButton(
                        //color: Colors.blue,
                        height: 45,
                        leftWight: Container(
                          child: Text("我的钱包",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text('手机充值',style: TextStyle(color: Colors.grey[300]),),
                                margin: EdgeInsets.fromLTRB(8, 13, 3, 13),
                              ),
                              Container(
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                                margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.8))
                        ),
                      ),
                      LongButton(
                        //color: Colors.blue,
                        height: 44,
                        leftWight: Container(
                          child: Text("免流量看头条",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text('移动用户免费领15G流量',style: TextStyle(color: Colors.grey[300]),),
                                margin: EdgeInsets.fromLTRB(8, 13, 3, 13),
                              ),
                              Container(
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                                margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.8))
                        ),
                      ),
                      LongButton(
                        //color: Colors.blue,
                        height: 45,
                        leftWight: Container(
                          child: Text("京东特供",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text('新人领188元红包',style: TextStyle(color: Colors.grey[300]),),
                                margin: EdgeInsets.fromLTRB(8, 13, 3, 13),
                              ),
                              Container(
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                                margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ), 
                Container(
                  color: Colors.white,
                  height: 90,
                  child: Column(
                    children: <Widget>[
                      LongButton(
                        //color: Colors.blue,
                        height: 45,
                        leftWight: Container(
                          child: Text("用户反馈",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                         rightWight: Container(
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                          margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: Colors.grey[300],width: 0.8))
                        ),
                      ),
                      LongButton(
                        //color: Colors.blue,
                        height: 45,
                        leftWight: Container(
                          child: Text("系统设置",style: TextStyle(fontSize: 15),),
                          margin: EdgeInsets.fromLTRB(15, 13, 0, 13),
                        ),
                        rightWight: Container(
                          child: Icon(Icons.keyboard_arrow_right,color: Colors.grey[300],size: 28,),
                          margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )         
            ],
        ),
      ),
      );
  }
}
