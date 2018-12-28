import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_app/common/websocketUtils.dart';
import 'dart:io';
class MessagePage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   //var retstr = GetNews.getNews('guonei');
  // TODO: implement build 
  return new Scaffold(
   body: new Center(
    child:new MyHomePage(
        title: "你好",
        channel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
   ),
  );
 }
}
class MyHomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = new TextEditingController();
  List<Widget> messages = new List();
  WebSocket _webSocket;
  //构造方法
 MyHomePageState(){
   MessageUtils.connect("ws://echo.websocket.org");
 }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     Future<WebSocket> futureWebSocket =
        WebSocket.connect("ws://echo.websocket.org");// Api.WS_URL 为服务器端的 websocket 服务
    futureWebSocket.then((WebSocket ws) {
      _webSocket = ws;
      _webSocket.readyState;
      //websocket返回消息监听
      _webSocket.listen((msg){
      setState(() {
              messages.add(Container(
                child: Text(_controller.text,style: TextStyle(fontSize: 20,color: Colors.blue),),
                height: 30,
              ));
            });
      var message = null!= msg?msg:"error";
      //print(message);
      });
    });
    return new Scaffold(
      /*appBar: new AppBar(
        title: new Text(widget.title),
      ),*/
      body: Container(
        child: Column(
          children: <Widget>[
              Container(
                  height:480,
                  decoration: BoxDecoration(
                    color: Colors.grey[350]
                ),
                child: ListView.builder(
                padding: const EdgeInsets.all(1.0),
                itemBuilder: (context, i) {//item
                return messages[i];
                },
                //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
                primary: false,
                //确定每一个item的高度 会让item加载更加高效
                itemExtent: 50.0,
                //内容适配
                shrinkWrap: true,
                //item 数量
                itemCount: messages.length,
              )
            ),
            Container(
              height:60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Icon(Icons.face),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: new Form(
                        child: new TextFormField(
                          //文本kongz
                          controller: _controller,
                          
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Container(
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: _sendMessage,
                        ),
                      ),
                    flex: 1,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100]
              ),
            ),
          ],
        ),
      )
    );
  }
  //发送消息
  _sendMessage() {
    //print("被点击");
    if (_controller.text.isNotEmpty) {
      var message=_controller.text;
      setState(() {
       messages.add(
          Container(
            child: Text(_controller.text,style: TextStyle(fontSize: 20,color: Colors.green),),
            height: 30,
          )
        );
     });
      //发送消息
      _webSocket.add(message);
      //有输入文字
      //widget.channel.sink.add(_controller.text);
      //MessageUtils.sendMessage(message);
      /*String retmessage = "null";
        if(null!=retmessage){
          messages2.add(Text(retmessage,style: TextStyle(fontSize: 20,color: Colors.blue),));
        setState(() {
                  messages=messages2;
                });
        }*/
    }else{
      //文本框为空
    }
  }
  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}