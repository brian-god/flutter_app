import 'package:flutter/material.dart';
import 'package:flutter_app/widget/platform_tap_widget.dart';
class IconTextButton extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;
  final Color tcolor;
  final double iconWidth;
  final double iconHeight;
  final double fontSize;
  final EdgeInsetsGeometry iconMarage;
  const IconTextButton({
    Key key,
    this.image,
    this.text,
    this.onTap,
    this.tcolor,
    this.iconWidth,
    this.iconHeight,
    this.fontSize,
    this.iconMarage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTapWidget(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(//25-25-15
            child:Image.asset(image,height: iconHeight,width:iconWidth,),
            margin: iconMarage,
          ),
          Text(text,style: TextStyle(fontSize: fontSize,color: tcolor),),
        ],
      ),
      //backgroundColor: Colors.blue,
    );
  }
}
