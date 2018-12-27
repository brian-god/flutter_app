 import 'dart:async';
 import 'package:flutter/material.dart';
 import 'package:flutter/services.dart';
 import './views/login/login.dart';
 import 'dart:ui';
 void main() => runApp(new MyApp());

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return new MaterialApp(
       title: '启动图demo',
       theme: new ThemeData(
           brightness: Brightness.light,
           backgroundColor: Colors.white,
           platform: TargetPlatform.iOS),
       home: new SplashScreen(),
       routes: <String, WidgetBuilder>{
         '/login': (BuildContext context) => new MyLoginPage()
       },
     );
   }
 }
 class SplashScreen extends StatefulWidget {
   @override
   _SplashScreenState createState() => new _SplashScreenState();
 }

 class _SplashScreenState extends State<SplashScreen> {
   var timevlue =5;
   startTime() async {
     //设置启动图生效时间
     var _duration = new Duration(seconds: 5);
     return new Timer(_duration, navigationPage);
   }

   void navigationPage() {
     Navigator.of(context).pushReplacementNamed('/login');
   }
   //倒计时实现
  chengeValue() async {
     //设置启动图生效时间
      //设置启动图生效时间
     var _duration = new Duration(seconds: 1);
      new Timer(_duration,(){
        _change();
         new Timer(_duration,(){
          _change();
           new Timer(_duration,(){
            _change();
             new Timer(_duration,(){
              _change();
               new Timer(_duration,(){
                _change();
                 new Timer(_duration,(){
                _change();
                });
              });
            });
          });
        });
      });
  }
   @override
   void initState() {
     super.initState();
     chengeValue();
     startTime();
   }

   @override
   Widget build(BuildContext context) {
     return new Scaffold(
       backgroundColor:Colors.greenAccent[200] ,
       body:new Image.asset(
         'statics/images/welecome.jpg',
         fit: BoxFit.fill,
         width:window.physicalSize.width ,
         height: window.physicalSize.height,),
          floatingActionButton: FloatingActionButton(
            onPressed: _skipPage,
            foregroundColor: Colors.red[600],
            backgroundColor: Color.fromRGBO(250, 250, 250, 0.01),
            tooltip: 'Increment',
            child: Text("跳过 "+timevlue.toString()),
          
      ), // This trailing comma makes auto-formatting nicer for build methods.
     );
   }
   /**
    * 跳过页面
    */
   void _skipPage(){
     navigationPage();
   }
   void _change(){
      setState(() {
              if(timevlue>0){
                timevlue--;
              }
            });
   }
 }