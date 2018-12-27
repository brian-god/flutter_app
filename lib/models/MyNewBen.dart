import 'dart:convert' show json;

class RetData {

  //int code;
  String message;
  List<NewsDatas> datas;

  RetData.fromParams({this.message, this.datas});

  factory RetData(jsonStr) => jsonStr == null ? null : jsonStr is String ? new RetData.fromJson(json.decode(jsonStr)) : new RetData.fromJson(jsonStr);
  
  RetData.fromJson(jsonRes) {
    //code = jsonRes['code'];
    message = jsonRes['message'];
    datas = jsonRes['datas'] == null ? null : [];

    for (var datasItem in datas == null ? [] : jsonRes['datas']){
            datas.add(datasItem == null ? null : new NewsDatas.fromJson(datasItem));
    }
  }

  @override
  String toString() {
    return '{"message": ${message != null?'${json.encode(message)}':'null'},"datas": $datas}';
  }
}

class NewsDatas {

  String imgurl;
  String label;
  String newstype;
  String time;
  String title;
  String tlink;

  NewsDatas.fromParams({this.imgurl, this.label, this.newstype, this.time, this.title, this.tlink});
  
  NewsDatas.fromJson(jsonRes) {
    imgurl = jsonRes['imgurl'];
    label = jsonRes['label'];
    newstype = jsonRes['newstype'];
    time = jsonRes['time'];
    title = jsonRes['title'];
    tlink = jsonRes['tlink'];
  }

  @override
  String toString() {
    return '{"imgurl": ${imgurl != null?'${json.encode(imgurl)}':'null'},"label": ${label != null?'${json.encode(label)}':'null'},"newstype": ${newstype != null?'${json.encode(newstype)}':'null'},"time": ${time != null?'${json.encode(time)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"tlink": ${tlink != null?'${json.encode(tlink)}':'null'}}';
  }
}

