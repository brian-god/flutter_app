
import 'dart:io';
import './../views/messagepage/indexpage.dart';
class MessageUtils {
  static WebSocket _webSocket;

  static void connect(String url) {
    Future<WebSocket> futureWebSocket =
        WebSocket.connect(url);// Api.WS_URL 为服务器端的 websocket 服务
    futureWebSocket.then((WebSocket ws) {
      _webSocket = ws;
      _webSocket.readyState;
      _webSocket.listen((msg){
      print("进入方法");
      var message = null!= msg?msg:"error";
      //print(message);
      });
    });
  }
  /*
   *获取服务端返回内容 
   */
  static String retMessage(){
    String message;
     _webSocket.listen((msg){
         message = null!= msg?msg:"error";
      });
      return message;
  }
  /*
   *获取连接 
   */
  static WebSocket getWebSocket(){
    return _webSocket;
  }
  static void closeSocket() {
    _webSocket.close();
  }

  // 向服务器发送消息
  static void sendMessage(String message) {
    _webSocket.add(message);
  }
}