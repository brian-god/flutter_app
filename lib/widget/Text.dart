/*
 * Created by 李卓原 on 2018/9/7.
 * email: zhuoyuan93@gmail.com
 *
 */
 
import 'package:flutter/material.dart';

class TextFieldAndCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<TextFieldAndCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('输入和选择'),
    ),body:TextField(),
    );
  }
}