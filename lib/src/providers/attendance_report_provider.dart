import 'package:ajman_app/src/models/attendance_report_json_model.dart';
import 'package:ajman_app/src/resources/apis/attendance_api.dart';
import 'package:flutter/material.dart';


class AttendanceReportProvider with ChangeNotifier{

  List<AttendReportJson> attendeReportList;

  attendeReport(String childID){
    getAttendeReport(childID).then((value) {
      attendeReportList =[];
      if(value != null){
        attendeReportList.addAll(value);
        notifyListeners();
      }
    });

  }
}