import 'package:flutter/material.dart';
import './videoItem/videoItem.dart';

class VideoPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   List<Widget> videos = new List();
   for(int i=0;i<10;i++){
     videos.add(VideoiItme(
            url: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4',
          ));
   }
  // TODO: implement build
  return new Scaffold(
   body: Container(
     child: ListView(
        children: videos,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[400]
      ),
   )
  );
 }
}
