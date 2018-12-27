/*
用作获取新闻
*/ 
import 'package:http/http.dart' as http;
import 'dart:convert';
  //返回接口数据
   getNews(String type) async{
    String retstr;
    var url ="http://www.luxiaosong.top:9099/myapi/newsapi/"+type;
    //向指定URL发送GET请求
    http.get(url).then((response) {
      if(response.statusCode==200){
        //获取相应内容中的字节列表
        List<int> bytes = response.bodyBytes;
        //将字字节列表转为字符串
        retstr = utf8.decode(bytes);
      }else{
        retstr = 'error';
      }
    });
     return retstr;
  }