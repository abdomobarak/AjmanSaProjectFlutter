
import 'package:ajman_app/src/models/news_josn_model.dart';
import 'package:ajman_app/src/resources/apis/news_api.dart';
import 'package:flutter/material.dart';


class NewsProvider with ChangeNotifier{

  List<News> newsList;
  List<News> reversedNewsList;

  NewsProvider(){
    getNews().then((value) {
      if(value != null){
        newsList =[];
        newsList.addAll(value);
        reversedNewsList = newsList.reversed.toList();
        notifyListeners();
      }
    });
  }

}