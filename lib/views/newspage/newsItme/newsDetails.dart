import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
/**
 * 头条页面
 */
/**
 * 创建一个有状态组件
 */
class NewsDetails  extends StatefulWidget{
  final String author_name;
  final  String category;
  final  String date;
  final  String title;

  final  String url;
  //构造函数传参
  NewsDetails({
    @required this.title,
    @required this.url,
    this.author_name,
    this.category,
    this.date});
  @override
  NewsDetailsState createState () => NewsDetailsState();
}

class NewsDetailsState extends State<NewsDetails>{
  /**
   * 构造方法
   */
  @override
  void initState(){
    super.initState();
  }
  List<Card> chlids;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build  PreferredSize
      return MaterialApp(
        routes: {
          "/": (_) =>WebviewScaffold(
            appBar: AppBar(
              backgroundColor: Colors.red[600],
              leading: IconButton(
                icon: Icon(Icons.navigate_before,size: 35,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: Text(widget.title),
            ),
            url: widget.url,
          ), 
        },
      );
    }
   
}