import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/home/home.dart';
 class MyLoginPage extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return new MaterialApp(
          home: LoginScreen(),
          routes: <String,WidgetBuilder>{
            '/home':(BuildContext context) => new MyHome()
          },
        );
      }
 }
 class LoginScreen extends StatefulWidget {
   @override
   _LoginScreenState createState() => new _LoginScreenState();
 }
 //登陆控制类
 class _LoginScreenState extends State<LoginScreen>{
      //用户名控制器
   TextEditingController  usercontroller = new TextEditingController();
   //密码控制器
   TextEditingController  padcontroller = new TextEditingController();
   //用户名的错误提示内容
   var userError = "";
  //密码的错误提示内容
   var pwdError = "";
   /**
    * 初始初始状态
    */
   @override
   void initState() {
     super.initState();
   }
   @override
     Widget build(BuildContext context) {
        const  user_hleptext ="请输入用户名";
        const  pwd_hleptext ="请输入密码";
       // TODO: implement build
       return Scaffold(
              body: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                              Container(
                                child:  Image.asset("statics/images/blog.jpeg",fit:BoxFit.fill,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60)
                                ),
                                width: 110.0,
                                height: 110.0,
                              ),
                             Container(
                               child:  TextField(
                                decoration:InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: user_hleptext,
                                  helperText: userError,
                                  helperStyle: TextStyle(
                                    color: Colors.red[700],
                                    fontSize: 14,
                                  )
                                ),
                                keyboardType: TextInputType.text,
                                controller: usercontroller,
                                onChanged: _clertext,
                              ),
                              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                             ),
                              Container(
                                child: TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.keyboard),
                                  hintText: pwd_hleptext,
                                  helperText: pwdError,
                                  helperStyle: TextStyle(
                                    color: Colors.red[700],
                                    fontSize: 14,
                                  )
                                ),
                                obscureText: true,
                                controller: padcontroller,
                                onChanged: _clertext,
                              ),
                              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                              ),
                              Container(
                                child: RaisedButton(
                                  child: Text("登陆"),
                                  textColor: Colors.white,
                                  color: Colors.blue[700],
                                  disabledColor: Colors.grey,
                                  highlightColor: Colors.grey,
                                  // 按下的背景色
                                  splashColor: Colors.green,
                                  // 水波纹颜色
                                  colorBrightness: Brightness.light,
                                  // 主题
                                  elevation: 10,
                                  highlightElevation: 10,
                                  disabledElevation: 10,
                                  padding: EdgeInsets.fromLTRB(93, 10, 93, 10),
                                  onPressed: _loginEvent,
                                ),
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              ),
                            ],                           
                  ),
                  width: 280,
                  height: 400,
                  //设置内容居中
                  alignment: Alignment.center,
                  //相当于容器修饰器
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.indigo[400],
                      width: 3.0,
                    ),
                    //实现圆角效果
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding:EdgeInsets.all(30.0),
                )
              ),
              backgroundColor: Colors.blueGrey[800],
          );
     }
    /**
     * 清空错误内容
     */
     void _clertext(String str){
       setState(() {
              userError="";
              pwdError="";
            });
     }
        /**
     * 登陆按钮控制
     */
    void _loginEvent() {
      //刚进来时候清空提示消息
      _clertext(null);
      //获取用户名
     var user = usercontroller.text;
     if(""==user){
       setState(() {
              userError="用户名不能为空";
            });
        return;
     }
     //获取密码
     var password = padcontroller.text;
      if(""==password){
       setState(() {
              pwdError="密码不能为空";
            });
        return;
     }
     //跳转至home页面
     Navigator.of(context).pushReplacementNamed("/home");
    }
 }
