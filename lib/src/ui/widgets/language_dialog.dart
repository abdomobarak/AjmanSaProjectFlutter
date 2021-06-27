
import 'package:ajman_app/src/app.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LanguageDialog{




  int langRadioItem = 0;



  showAlertDialog(BuildContext context) {

    SharedPreferences preferences ;

    return showDialog(
      context: context,
        builder: (_) {

          return AlertDialog(
            title: Center(child: Text(
              AppLocalizations.of(context).translate('language')
            )),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: languagesList(context),
               elevation: 5,
              actions: [


            FlatButton(
              onPressed: ()async{
                preferences = await SharedPreferences.getInstance();
                Navigator.of(context).pop();
                if(langRadioItem == 0){
                  MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'en'));
                  preferences.setString('ajmanLocal', 'en');
                }else {
                  MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'ar'));
                  preferences.setString('ajmanLocal', 'ar');
                }

              },
              child: Text(
                AppLocalizations.of(context).translate('ok'),
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 14.0
                ),
              ),
            )
              
            ],


          );

        }
    );

  }





  languagesList(BuildContext context) {

    Map<dynamic , dynamic> langugesMap = {
      0:AppLocalizations.of(context).translate('en_lang'),
      1:AppLocalizations.of(context).translate('ar_lang'),
    };

    return StatefulBuilder(
        builder:(context, setState) =>
         ListView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount:langugesMap.length,
           itemBuilder: (context, index) =>
            RadioListTile(
              title: Text(
                  langugesMap[index].toString()
              ),
              onChanged: (val) {
                setState(() {
                  langRadioItem = int.parse(val.toString());
                });
              },
              groupValue: langRadioItem,
              value: index,
              activeColor:Colors.deepOrange,

            ),
         )
    );

  }
}