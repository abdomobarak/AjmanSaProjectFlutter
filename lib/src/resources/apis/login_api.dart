
import 'package:http/http.dart' as http;


 Future  getLoginData(String userName)async{
   const String url = 'https://ajmansa.com/api-user/';
   var response = await http.get(Uri.parse(url+userName));
   if (response.statusCode == 200) {
     return response.body;
   }
   throw Exception('Failed to load post');
}
