import 'package:ajman_app/src/models/coaches_json_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


Future<List<Coachs>> getCoahes()async{
  const String url = 'https://ajmansa.com/api-coach';
  List<Coachs> coachsList = [];
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    coachsList =  List<Coachs>.from(jsonResponse.map((i) => Coachs.fromJson(i)));
    return coachsList;
  }
  throw Exception('Failed to load post');
}