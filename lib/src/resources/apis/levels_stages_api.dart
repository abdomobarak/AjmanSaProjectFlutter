


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ajman_app/src/models/levels_stages_json_model.dart';

Future<List<Stages>> getLevels(String levelTitle)async{

  List<Stages> levelsStagesList = [];
  const String url = 'https://ajmansa.com/api-stages/';
  var response = await http.get(Uri.parse(url+levelTitle));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    levelsStagesList =  List<Stages>.from(jsonResponse.map((i) => Stages.fromJson(i)));
    return levelsStagesList;
  }
  throw Exception('Failed to load post');

}