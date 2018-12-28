import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_app/common/websocketUtils.dart';
import 'dart:io';
class WeChatHomePage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   //var retstr = GetNews.getNews('guonei');
  // TODO: implement build 
  return new MaterialApp(
   home: new Center(
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
      //print(message);
      });
    });
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel,size:35,color:Colors.white),
          //跳出页面
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: new Text('谈天说地'),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => messages[index],
              itemCount: messages.length,
            )
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
            height: 50,
          )
        ]
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
    }else{
      //文本框为空
    }
  }
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Expanded(
              child: Container(
                child: Icon(Icons.face,size: 33,),
              ),
              flex: 1,
            ),
            Expanded(
            child: Container(
              child: new Form(
                child: new TextField(
                   //文本kongz
                  controller: _controller,  
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(4, 9, 4, 9),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2,style: BorderStyle.solid)),
                    hintText: "请输入消息",
                    disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2,style: BorderStyle.solid) ),
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 6, 0, 4),
            ),
            flex: 4,
            ),
            Expanded(
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.send,size: 33,),
                    onPressed: _sendMessage,
                  ),
              ),
              flex: 1,
            ),
          ],
        ),
      )
    );
  }
}