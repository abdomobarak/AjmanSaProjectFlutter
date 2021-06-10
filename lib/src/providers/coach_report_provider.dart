import 'package:ajman_app/src/models/coach_report_json_model.dart';
import 'package:ajman_app/src/resources/apis/coach_report_api.dart';
import 'package:flutter/material.dart';



class CoachReportProvider with ChangeNotifier{
  List<CoachNotes> coachNotes ;

  coachRepportList(String childID){
    getCoachReport(childID).then((value) {
      coachNotes =[];
      if(value != null){
        coachNotes.addAll(value);
        notifyListeners();
      }
    });

  }
}