import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/ben/newsben.dart';
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
  List<Card> chlids;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Center(
        child: Container(
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
           List<Card> chlids1 = new List();
           //遍历集合创建卡片
           for (newsitem item in newdata.data) {
              chlids1.add(Card(
                child: Column(
                  children: <Widget>[
                    Text(item.title,style: TextStyle(fontSize: 15),),
                    Center(
                      child: Image.network(item.thumbnail_pic_s,fit: BoxFit.cover,),
                      //heightFactor: 100,
                    ),
                    //Image.network(item.thumbnail_pic_s02),
                    //Image.network(item.thumbnail_pic_s03),
                  ],
                ),
              ));
           }
           setState(() {
              chlids = chlids1;
            });
            //print(newtree.toString());
         }else{
           print("error");
         }    
       }
}