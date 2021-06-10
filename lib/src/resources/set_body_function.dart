
import 'package:ajman_app/src/providers/body_provider.dart';
import 'package:ajman_app/src/providers/check_login_provider.dart';
import 'package:ajman_app/src/ui/screens/academy_location.dart';
import 'package:ajman_app/src/ui/screens/children_screen.dart';
import 'package:ajman_app/src/ui/screens/coaches_screen.dart';
import 'package:ajman_app/src/ui/screens/levels_screen.dart';
import 'package:ajman_app/src/ui/screens/login_screen.dart';
import 'package:ajman_app/src/ui/screens/news_screen.dart';
import 'package:ajman_app/src/ui/screens/offers_screen.dart';
import 'package:ajman_app/src/ui/widgets/contact_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



setMainBody(int index, BuildContext context)  {
  var bodyProvider = Provider.of<BodyProvider>(context,listen: false);

  switch(index){
    case 0 :
      Navigator.of(context).pop();
      bodyProvider.setBody(NewsScreen());
      break;
    case 1 :
      Navigator.of(context).pop();
      checkLogin(context);
      break;
    case 2 :
      Navigator.of(context).pop();
      bodyProvider.setBody(CoachesScreen());
      break;
    case 3 :
      Navigator.of(context).pop();
      bodyProvider.setBody(LevelsScreen());
      break;
    case 4 :
      Navigator.of(context).pop();
      bodyProvider.setBody(OffersScreen());
      break;
    case 5 :
      Navigator.of(context).pop();
      contactBottomSheet(context);
      break;
    case 6:
      Navigator.of(context).pop();
      bodyProvider.setBody(AcademyLocation());
      break;

  }


}



void checkLogin(BuildContext context)async {
  var bodyProvider = Provider.of<BodyProvider>(context,listen: false);
  var checkLoginProvider = Provider.of<CheckLoginProvider>(context,listen: false);

  if(checkLoginProvider.user == '' || checkLoginProvider.user == null ){
    bodyProvider.setBody(LoginScreen());
  }else {
    bodyProvider.setBody(ChildrenScreen());
  }



}