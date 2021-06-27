
import 'dart:convert';

import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/resources/close_keyboard_function.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


void forgetPassword(String userEmail,BuildContext context)async{

  const String url ='https://ajmansa.com/forget-password1';

  var response = await http.post(
      Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'resetEmail': userEmail,
    }),
  );




  if(response.statusCode == 200 ){

    if(response.body == 'email sent'){
      Navigator.of(context).pop();
      showSnackBar(AppLocalizations.of(context).translate('email_sent'), context);

    }else if(response.body == 'wrong email'){
      Navigator.of(context).pop();
      showSnackBar(AppLocalizations.of(context).translate('wrong_email'), context);
    }

  }else {
    Navigator.of(context).pop();
    showSnackBar(AppLocalizations.of(context).translate('network_failed'), context);
  }



}