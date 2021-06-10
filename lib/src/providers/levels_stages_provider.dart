import 'package:ajman_app/src/models/levels_stages_json_model.dart';
import 'package:ajman_app/src/resources/apis/levels_stages_api.dart';
import 'package:flutter/material.dart';



class LevelsStagesProvider with ChangeNotifier{
  List<Stages> levelsStagesList;

  getLevelsStagesProvider(String leveTitle){
    levelsStagesList = null;
    getLevels(leveTitle).then((value) {
      levelsStagesList = [];
      if(value != null){
        levelsStagesList.addAll(value);
        notifyListeners();
      }
    });
  }
}