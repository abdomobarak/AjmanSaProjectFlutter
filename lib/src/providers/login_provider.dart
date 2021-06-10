import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/body_provider.dart';
import 'package:ajman_app/src/providers/check_login_provider.dart';
import 'package:ajman_app/src/resources/apis/login_api.dart';
import 'package:ajman_app/src/resources/close_keyboard_function.dart';
import 'package:ajman_app/src/ui/screens/children_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier{

  String response;
  SharedPreferences preferences;

  checkUser(String userName,String userPassword,BuildContext context){
    var bodyProvider = Provider.of<BodyProvider>(context,listen: false);
    var checkLoginProvider = Provider.of<CheckLoginProvider>(context,listen: false);

    getLoginData(userName).then((value) async {
      response ='';
      if(value != null){
        response = value;
        if(response == 'wrong user'){
          Navigator.of(context).pop();
          showSnackBar(AppLocalizations.of(context).translate('wrong_user'), context);
        }else if(response == userPassword) {
          checkLoginProvider.loginUser(userName);
          Navigator.of(context).pop();
          bodyProvider.setBody(ChildrenScreen());
        }else {
          Navigator.of(context).pop();
          showSnackBar(AppLocalizations.of(context).translate('wrong_password'), context);
        }
      }
    });
  }



}