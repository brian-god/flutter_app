import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:flutter_app/ben/newsben.dart';
import 'package:flutter_app/widgets/MyCard.dart';
import 'package:flutter_app/models/MyNewBen.dart';
import './newsDetails.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
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
  RetData  newdata;
  List<NewsDatas>  newsdatas = new List();
  List<NewsDatas>  newsdatas2;
  var errorpage;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Center(
        child: errorpage!=null?errorpage:Container(
            child: newdata!= null?ListView.builder(
              padding: const EdgeInsets.all(1.0),
              itemBuilder: (context, i) {//item
              //添加一个1像素高度的分割线
              //if (i.isOdd) return new Divider();
              //i~/2 意为 i除以2，返回int型整数
              //例如i分别为1，2，3，4，5，结果分别为 0，1，1，2，2
              //以此来计算ListView中词组的真实数量，减掉了分割线的数量
              /*final index = i ~/ 2;
              int pag=(i-1)*5;
              double pageSum= (newdata.datas.length-1)/5+1;
              //newsdatas=newdata.datas;
              if(index==0){
                for(var i=0;i<5;i++){
                  var datee = newdata.datas[i];
                  newsdatas.add(datee);
                }
              }
              if (index >= newdata.datas.length) {//如果已经达到数组的末尾
              newsdatas.addAll(newdata.datas);//每次创建20个词组，添加进去
              }*/
            return _buildRow(newdata.datas[i]);
            }
          ):Center(
            child: Text("加载中..."),
          )
        )
      );
    }
    Widget _buildRow(NewsDatas item){
    return MyCard(
        title: item.title,
        thumbnail_pic_s: item.imgurl,
        onTap:(){
          //跳转到新的 页面我们需要调用 navigator.push方法 这个和eactNative的方式相同
          Navigator.push(context, 
            MaterialPageRoute(
            builder: (context) => NewsDetails(
              title: item.title,
              url: item.tlink,
            )
          ));
      },
    );
  }

     /**
  * 请求头条的Api
  */
 _get() async{
       var url ="http://www.luxiaosong.top:9099/myapi/newsapi/"+widget.type;
      //向指定URL发送GET请求
          //向指定URL发送GET请求
      http.get(url).then((response) {
        if(response.statusCode==200){
          //获取相应内容中的字节列表
          List<int> bytes = response.bodyBytes;
          //将字字节列表转为字符串
          var retstr = utf8.decode(bytes);
          //获取根集合
            Map  newtree = json.decode(retstr);
            RetData  newdata1 = new RetData.fromJson(newtree);
            setState(() {
                newdata = newdata1;
                errorpage =null;
            });
        }else{
          setState(() {
                errorpage=Center(
                child: Text("请求异常！！",style: TextStyle(fontSize: 30),),
              );
          });
        }
      });   
    }
}