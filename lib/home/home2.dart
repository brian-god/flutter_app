import 'package:flutter/material.dart';
import 'package:flutter_app/widget/Text.dart';
 class MyHome extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return new MaterialApp(
          home: new Container(
              child: new Center(
                child: Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new TextField(
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        icon: Icon(Icons.text_fields),
                        labelText: '请输入你的姓名)',
                        helperText: '请输入你的真实姓名',
                      ),
                    onChanged: _textFieldChanged,
                    autofocus: false,
                  ),
                    ],
                  ),
                  width: 300,
                  height: 500,
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
                ),
              ),
            color: Colors.blueGrey[800],
          ),
        );
      }
    void _textFieldChanged(String str) {
      print(str);
    }
 }