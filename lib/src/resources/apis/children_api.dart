


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ajman_app/src/models/children_json_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Children>> getChildren()async{
  List<Children> childrenList = [];
  SharedPreferences preferences;
  const String url = 'https://ajmansa.com/api-userStudent/';

  preferences = await SharedPreferences.getInstance();
  String user = preferences.getString('ajmanLogin');

  if(user != null || user != ''){
    var response = await http.get(Uri.parse(url+user));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      childrenList =  List<Children>.from(jsonResponse.map((i) => Children.fromJson(i)));
      return childrenList;
    }
    throw Exception('Failed to load post');
  }


}