import 'package:flutter/material.dart';
import 'package:flutter_app/widget/platform_tap_widget.dart';
class IconTextButton extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;
  final Color tcolor;

  const IconTextButton({
    Key key,
    this.image,
    this.text,
    this.onTap,
    this.tcolor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTapWidget(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            child:Image.asset(image,height: 25,width: 25,),
          ),
          Text(text,style: TextStyle(fontSize: 15,color: tcolor),),
        ],
      ),
      //backgroundColor: Colors.blue,
    );
  }
}
