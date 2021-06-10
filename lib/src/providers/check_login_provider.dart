import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckLoginProvider with ChangeNotifier{

  String user;
  SharedPreferences preferences;

  checkUserLogin()async{
    preferences =await SharedPreferences.getInstance();
    String checkedUser = preferences.get('ajmanLogin');

    user = checkedUser;
    notifyListeners();
  }


  loginUser(String userName)async{
    preferences =await SharedPreferences.getInstance();
    preferences.setString('ajmanLogin', userName);
    checkUserLogin();
    notifyListeners();

  }


  logoutUser()async{
    preferences =await SharedPreferences.getInstance();
    preferences.setString('ajmanLogin','');
    checkUserLogin();
    notifyListeners();

  }


}