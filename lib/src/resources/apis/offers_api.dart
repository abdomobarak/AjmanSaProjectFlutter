

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ajman_app/src/models/offers_json_model.dart';

Future<List<Offers>> getOffers()async{
  List<Offers> offersList =[];
  const String url = 'https://ajmansa.com/api-offers';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    offersList =  List<Offers>.from(jsonResponse.map((i) => Offers.fromJson(i)));
    return offersList;
  }
  throw Exception('Failed to load post');
}