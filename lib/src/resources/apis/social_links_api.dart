




import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ajman_app/src/models/social_links_josn_model.dart';

Future<List<SocialLinksJsonModel>> getSocialLinks()async{

  List<SocialLinksJsonModel> socialList = [];
  const String url = 'https://ajmansa.com/api-social';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    socialList =  List<SocialLinksJsonModel>.
    from(jsonResponse.map((i) => SocialLinksJsonModel.fromJson(i)));
    return socialList;
  }
  return socialList;

}