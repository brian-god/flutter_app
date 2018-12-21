import 'package:flutter/material.dart';
import 'package:flutter_app/widget/IconTextButton.dart';
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
                        child: new FadeInImage.assetNetwork(
                          placeholder: "images/normal_user_icon.webp",//预览图
                          fit: BoxFit.fitWidth,
                          image:"http://s1.sinaimg.cn/bmiddle/4900366dt53c83e4d3890",
                          width: 80.0,
                          height: 80.0,
                        ),
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
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                           Expanded(
                            child:Container(
                                color: Colors.red,
                                height: 50,
                              ),
                              flex: 1,
                           ),
                           Expanded(
                            child:Container(
                                color: Colors.green,
                                height: 50,
                              ),
                              flex: 2,
                           ),
                           Expanded(
                            child:Container(
                                color: Colors.red,
                                height: 50,
                              ),
                              flex: 1,
                           ),
                        ],
                      ),
                      Card(
                        child: Container(
                          height: 20,
                          
                        ),
                        
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                ), 
                Container(
                  color: Colors.orange,
                  height: 80,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                ), 
                Container(
                  color: Colors.pink,
                  height: 80,
                )         
            ],
        ),
      ),
      );
  }
}
