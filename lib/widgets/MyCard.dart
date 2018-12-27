import 'package:flutter/material.dart';
//import 'package:flutter_app/widget/platform_tap_widget.dart';
class MyCard extends StatelessWidget {
  final String author_name;
  final String category;
  final String date;
  final String thumbnail_pic_s;
  final String thumbnail_pic_s02;
  final String thumbnail_pic_s03;
  final String title;
  final String uniquekey;
  final String url;
  final Function onTap;
  const MyCard({
    Key key,
    this.url,
    this.title,
    this.date,
    this.category,
    this.author_name,
    this.onTap,
    this.thumbnail_pic_s,
    this.thumbnail_pic_s02,
    this.thumbnail_pic_s03,
    this.uniquekey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Card(
          child: Column(
            children: <Widget>[
              Text(this.title,style: TextStyle(fontSize: 15),),
              Container(
                  child:  Center(
                  child: Image.network(this.thumbnail_pic_s,fit: BoxFit.fill,),
                  //heightFactor: 100,
                ),
                height: 200,
              )
               //Image.network(item.thumbnail_pic_s02),
              //Image.network(item.thumbnail_pic_s03),
            ],
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
        ),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[400],width: 2))
        ),
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        height: 300,
      )
      //backgroundColor: Colors.blue,
    );
  }
}
