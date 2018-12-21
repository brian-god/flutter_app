import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/ben/newsben.dart';
import 'package:flutter_app/widget/MyCard.dart';
import 'package:flutter_app/page/homeItme/newsDetails.dart';
//
/**
 * 头条页面
 */
/**
 * 创建一个有状态组件
 */
class NewsiItme  extends StatefulWidget{
  //参数
  final String type;
  //构造函数传参
  NewsiItme({@required this.type});
  @override
  NewsiItmeState createState () => NewsiItmeState();
}

class NewsiItmeState extends State<NewsiItme>{
  /**
   * 构造方法
   */
  @override
  void initState(){
    super.initState();
    _get();
  }
  List<MyCard> chlids;
  var errorpage;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Center(
        child: errorpage!=null?errorpage:Container(
          child: ListView(
            padding: EdgeInsets.all(50),
            children:chlids==null?[
              Center(
                child: Text("加载中..."),
              )
            ]:chlids,
          ),
        ),
      );
    }
     /**
  * 请求头条的Api
  */
 _get() async {
        var responseBody;
         var url='http://v.juhe.cn/toutiao/index?type='+widget.type+'&key=556d27c3bde10d1714cf98322e03c885';
         var httpClient = new HttpClient();
         var request = await httpClient.getUrl(Uri.parse(url));
         var response = await request.close();
         if (response.statusCode == 200) {
           responseBody = await response.transform(utf8.decoder).join();
           //获取根集合
           Map  newtree = json.decode(responseBody);
           newsdetas  newdata = new newsdetas.fromJson(newtree['result']);
           //创建存储数据的集合
           List<MyCard> chlids1 = new List();
           //遍历集合创建卡片
           for (newsitem item in newdata.data) {
              chlids1.add(MyCard(
                title: item.title,
                thumbnail_pic_s: item.thumbnail_pic_s,
                onTap:(){
                  //跳转到新的 页面我们需要调用 navigator.push方法 这个和eactNative的方式相同
                  Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(
                        title: item.title,
                        url: item.url,
                      )
                    ));
                },
              ));
           }
           setState(() {
              chlids = chlids1;
              errorpage =null;
            });
            //print(newtree.toString());
         }else if(response.statusCode == 112){
           setState(() {
                        errorpage=Center(
                          child: Text("超过了当日请求的最大次数！！",style: TextStyle(fontSize: 30),),
                        );
                      });
         }    
       }
}