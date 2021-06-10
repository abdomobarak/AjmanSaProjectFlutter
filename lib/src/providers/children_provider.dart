import 'package:ajman_app/src/models/children_json_model.dart';
import 'package:ajman_app/src/resources/apis/children_api.dart';
import 'package:flutter/material.dart';



class ChildrenProvider with ChangeNotifier{
  List<Children> childreList;

  ChildrenProvider(){
    getChildren().then((value) {
      childreList = [];
      if(value != null){
        childreList.addAll(value);
        notifyListeners();
      }
    });
  }

}