import 'package:flutter/material.dart';
//import 'package:flutter_app/widget/platform_tap_widget.dart';
//长按钮
class LongButton extends StatelessWidget {
  final Widget leftWight;
  final Widget rightWight;
  final Function onTap;
  final double height;
  final BoxDecoration decoration;
  const LongButton({
    Key key,
    this.leftWight,
    this.rightWight,
    this.onTap,
    this.height,
    this.decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
      onTap: onTap,
      child:  Container(
        child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
              Container(
                child: leftWight,
              ),
              Container(
                child: rightWight
                ),
          ],
        ),
        height: height,
        decoration: decoration==null?BoxDecoration():decoration,
      )
      //backgroundColor: Colors.blue,
    )
    );
  }
}
