import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
//
/**
 * 视频组件
 */
/**
 * 创建一个有状态组件
 */
class VideoiItme  extends StatefulWidget{
  //参数
  final String url;
  final String describe;
  //构造函数传参
  VideoiItme({@required this.url,
  this.describe});
  @override
  VideoiItmeState createState () => VideoiItmeState();
}

class VideoiItmeState extends State<VideoiItme>{
 @override
   Widget build(BuildContext context) {
     // TODO: implement build
     return Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.max,
         children: <Widget>[
           Container(
             child: new Chewie(
                new VideoPlayerController.network(widget.url),
                aspectRatio: 16 / 9,
                autoPlay: !true,
                //looping: false,
                //showControls: true,
                // 占位图
                placeholder: new Container(
                    color: Colors.grey,
                    child: Image.asset("statics/images/vdeoCover.jpg",fit: BoxFit.fill,),
                ),

                // 是否在 UI 构建的时候就加载视频
                autoInitialize: !true,

                // 拖动条样式颜色
                materialProgressColors: new ChewieProgressColors(
                    playedColor: Colors.red,
                    handleColor: Colors.blue,
                    backgroundColor: Colors.grey,
                    bufferedColor: Colors.lightGreen,
                ),
              ),  
           ),
           Container(
             child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
               children: <Widget>[
                 Container(
                   child: Text('视频组件'),
                   height: 30,
                   margin: EdgeInsets.all(8),
                 ),
                 Container(
                   child: Icon(Icons.data_usage,size: 28,),
                   height: 30,
                   margin: EdgeInsets.fromLTRB(0, 5, 20, 8),
                 ),
               ],
             ),
             color: Colors.white,
           )
         ],
       ),
       margin: EdgeInsets.fromLTRB(0, 6, 0, 2),
       decoration: BoxDecoration(
         border: Border(bottom: BorderSide(color: Colors.grey[600],width: 2)),
         color: Colors.white
       ),
     );
   }
}