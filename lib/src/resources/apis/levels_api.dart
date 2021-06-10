import 'package:ajman_app/src/models/levels_json_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<List<Levels>> getLevels()async{
  List<Levels> levelsList =[];
  const String url = 'https://ajmansa.com/api-levels';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    levelsList =  List<Levels>.from(jsonResponse.map((i) => Levels.fromJson(i)));
    return levelsList;
  }
  throw Exception('Failed to load post');
}