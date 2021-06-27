

import 'package:ajman_app/src/models/news_josn_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;




Future<List<News>> getNews()async{
  List<News> newsList = [];
  const String url = 'https://ajmansa.com/api-news';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    newsList =  List<News>.from(jsonResponse.map((i) => News.fromJson(i)));
    return newsList;
  }
  return newsList;
}