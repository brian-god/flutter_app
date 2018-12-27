import 'package:flutter/material.dart';
import 'package:flutter_app/api/news/getNews.dart' as GetNews;
class MessagePage extends StatelessWidget {


 @override
 Widget build(BuildContext context) {
   var retstr = GetNews.getNews('guonei');
  // TODO: implement build 
  return new Scaffold(
   body: new Center(
    child:
    new Text(retstr==null?"加载中...":retstr),
   ),
  );
 }
}