import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
 class MyHome extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return new MaterialApp(
          routes: {
           "/": (_) => new WebviewScaffold(
              url: "http://localhost:3000/",
            )
          },
        );
    }
 }