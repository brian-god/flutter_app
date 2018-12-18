import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
//
/**
 * 头条页面
 */
class TopItme extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  // TODO: implement build
  //创建Httpclent对象
  var httpClient = new HttpClient();
  return new Center(
    child: Container(
      child: Text("头条"),
    ),
  );
 }
 /**
  * 请求头条的Api
  */
 _get() async {
         var responseBody;
         var url='http://v.juhe.cn/toutiao/index?type=top&key=556d27c3bde10d1714cf98322e03c885';
         var httpClient = new HttpClient();
         var request = await httpClient.getUrl(Uri.parse(url));
         var response = await request.close();
         if (response.statusCode == 200) {
           responseBody = await response.transform(utf8.decoder).join();
           responseBody=json.decode(responseBody);
         }else{
           print("error");
         }
         await responseBody['msg'].map((Map item){
           
         }).toList();     
       }
}