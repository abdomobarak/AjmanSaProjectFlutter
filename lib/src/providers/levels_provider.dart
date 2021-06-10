import 'package:ajman_app/src/models/levels_json_model.dart';
import 'package:ajman_app/src/resources/apis/levels_api.dart';
import 'package:flutter/material.dart';


class LevelsProvider with ChangeNotifier{

  List<Levels> levelsList;
  LevelsProvider(){
    getLevels().then((value) {
      levelsList = [];
      if(value != null){
        levelsList.addAll(value);
        notifyListeners();
      }
    });
  }

}