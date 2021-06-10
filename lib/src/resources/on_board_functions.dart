
import 'package:ajman_app/src/ui/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




 goToHome(BuildContext context)async{

   SharedPreferences logindata = await SharedPreferences.getInstance();
  bool newUser = (logindata.getBool('ajmanLogined') ?? true);

  if(newUser == true ){

    logindata = await SharedPreferences.getInstance();
    logindata.setBool('ajmanLogined', false);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) =>  HomeScreen()));
  }else{
    Navigator.of(context).pop();
  }

}