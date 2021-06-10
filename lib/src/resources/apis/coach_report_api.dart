

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ajman_app/src/models/coach_report_json_model.dart';

Future<List<CoachNotes>> getCoachReport(String childID)async{
  const String coachNotesUrl = 'https://ajmansa.com/api-report/';
  List<CoachNotes> CoachReport = [] ;
  var response = await http.get(Uri.parse(coachNotesUrl+childID.toString()));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    CoachReport =  List<CoachNotes>.from(jsonResponse.map((i) => CoachNotes.fromJson(i)));
    return CoachReport;
  }
  throw Exception('Failed to load post');


}