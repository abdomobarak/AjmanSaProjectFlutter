import 'package:ajman_app/src/models/social_links_josn_model.dart';
import 'package:ajman_app/src/resources/apis/social_links_api.dart';
import 'package:flutter/material.dart';


class SocialProvider with ChangeNotifier{

  List<SocialLinksJsonModel> socialList;

  SocialProvider(){
    getSocialLinks().then((value) {
      socialList = [];
      if(value != null) {
        socialList.addAll(value);
        notifyListeners();
      }
    });
  }

}