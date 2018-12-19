import 'dart:convert' show json;
class newsdetas {

  String stat;
  List<newsitem> data;

  newsdetas.fromParams({this.stat, this.data});
  
  newsdetas.fromJson(jsonRes) {
    stat = jsonRes['stat'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
            data.add(dataItem == null ? null : new newsitem.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"stat": ${stat != null?'${json.encode(stat)}':'null'},"data": $data}';
  }
}

class newsitem {

  String author_name;
  String category;
  String date;
  String thumbnail_pic_s;
  String thumbnail_pic_s02;
  String thumbnail_pic_s03;
  String title;
  String uniquekey;
  String url;

  newsitem.fromParams({this.author_name, this.category, this.date, this.thumbnail_pic_s, this.thumbnail_pic_s02, this.thumbnail_pic_s03, this.title, this.uniquekey, this.url});
  
  newsitem.fromJson(jsonRes) {
    author_name = jsonRes['author_name'];
    category = jsonRes['category'];
    date = jsonRes['date'];
    thumbnail_pic_s = jsonRes['thumbnail_pic_s'];
    thumbnail_pic_s02 = jsonRes['thumbnail_pic_s02'];
    thumbnail_pic_s03 = jsonRes['thumbnail_pic_s03'];
    title = jsonRes['title'];
    uniquekey = jsonRes['uniquekey'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"author_name": ${author_name != null?'${json.encode(author_name)}':'null'},"category": ${category != null?'${json.encode(category)}':'null'},"date": ${date != null?'${json.encode(date)}':'null'},"thumbnail_pic_s": ${thumbnail_pic_s != null?'${json.encode(thumbnail_pic_s)}':'null'},"thumbnail_pic_s02": ${thumbnail_pic_s02 != null?'${json.encode(thumbnail_pic_s02)}':'null'},"thumbnail_pic_s03": ${thumbnail_pic_s03 != null?'${json.encode(thumbnail_pic_s03)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"uniquekey": ${uniquekey != null?'${json.encode(uniquekey)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

