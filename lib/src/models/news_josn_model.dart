

import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    this.newsid,
    this.newstitle,
    this.newsdescription,
    this.newsimage,

  });

  int newsid;
  String newstitle;
  String newsdescription;
  String newsimage;

  factory News.fromJson(Map<String, dynamic> json) => News(
    newsid: json["newsid"],
    newstitle: json["newstitle"],
    newsdescription: json["newsdescription"],
    newsimage: json["newsimage"],
  );

  Map<String, dynamic> toJson() => {
    "newsid": newsid,
    "newstitle": newstitle,
    "newsdescription": newsdescription,
    "newsimage": newsimage,
  };
}
