import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/resources/launch_url_function.dart';
import 'package:flutter/material.dart';


poweredByWidget(BuildContext context) {
  String deamBizUrl = 'https://www.daembiz.com';
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pop();
          launchURL(deamBizUrl);
        },
        leading:Icon(
          Icons.verified_sharp,
          color: Colors.deepOrange,),
        title: Text(
          AppLocalizations.of(context).translate('powered_by'),
          style: TextStyle(
            //fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
        ),
        subtitle: Text(
          AppLocalizations.of(context).translate('daem_business'),
          style: TextStyle(
            //fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
        ),
      ),
    ),
  );
}