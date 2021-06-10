

import 'package:ajman_app/src/ui/screens/news_screen.dart';
import 'package:flutter/material.dart';


class BodyProvider with ChangeNotifier{

  Widget bodyWidget  = NewsScreen();


  setBody(Widget myWidget){
    bodyWidget = myWidget;
    notifyListeners();
  }



}