import 'package:flutter/material.dart';
import './videoItem/videoItem.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class VideoPage extends StatelessWidget {
final playerWidget = new Chewie(
  new VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4'
  ),
  aspectRatio: 3 / 2,
  autoPlay: true,
  looping: true,
);
 @override
 Widget build(BuildContext context) {
  // TODO: implement build
  String url = 'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4';
  return new Scaffold(
   body: new Center(
    child:Center(
      child: new Chewie(
         new VideoPlayerController.network(
          'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4'
        ),
        aspectRatio: 16 / 9,
        autoPlay: !true,
        looping: false,
        showControls: true,
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
    )/*ListView(
      children: <Widget>[
        VideoItem(),
        VideoItem(),
        VideoItem(),
      ],
    )*/
   ),
  );
 }
}
