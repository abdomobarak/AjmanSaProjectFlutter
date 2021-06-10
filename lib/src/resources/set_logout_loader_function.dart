import 'package:ajman_app/src/models/loader_dialog.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/check_login_provider.dart';
import 'package:ajman_app/src/resources/close_keyboard_function.dart';
import 'package:ajman_app/src/resources/set_body_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



final GlobalKey<State> loaderDialog = new GlobalKey<State>();


void setLogoutLoader(BuildContext context) {
  LoaderDialog.showLoadingDialog(context, loaderDialog);
  var checkLoginProvider = Provider.of<CheckLoginProvider>(context,listen: false);
  checkLoginProvider.logoutUser();
  new Future.delayed(new Duration(seconds: 3), () {
    Navigator.of(loaderDialog.currentContext,rootNavigator: true).pop();
    setMainBody(0, context);
    showSnackBar(AppLocalizations.of(context).translate('logout_message'), context);
  });

}