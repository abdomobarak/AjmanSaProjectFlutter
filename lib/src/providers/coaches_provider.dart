import 'package:ajman_app/src/models/coaches_json_model.dart';
import 'package:ajman_app/src/resources/apis/coaches_api.dart';
import 'package:flutter/material.dart';



class CoachesProvider with ChangeNotifier{
  List<Coachs> coachesList;
  CoachesProvider(){
    getCoahes().then((value) {
      coachesList =[];
      if(value != null){
        coachesList.addAll(value);
        notifyListeners();
      }
    });
  }


}