

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ajman_app/src/models/attendance_report_json_model.dart';



Future<List<AttendReportJson>> getAttendeReport(String childID)async{

  List<AttendReportJson> attendeReportList = [];
  const String url = 'https://ajmansa.com/api-attendance/';
  var response = await http.get(Uri.parse(url+childID));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    attendeReportList =  List<AttendReportJson>.from(jsonResponse.map((i) => AttendReportJson.fromJson(i)));
    return attendeReportList;
  }
  throw Exception('Failed to load post');

}