

import 'package:flutter/material.dart';

import '../providers/app_lang.dart';

class LoaderDialog {

  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          key: key,
          content: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Colors.red),
              ),
              Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text( AppLocalizations.of(context).translate('please_wait'))),
            ],),

        );
      },
    );
  }
}