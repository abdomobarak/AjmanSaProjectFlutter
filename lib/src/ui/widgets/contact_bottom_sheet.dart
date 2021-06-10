import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/resources/launch_url_function.dart';
import 'package:flutter/material.dart';




  contactBottomSheet(BuildContext context){
     String facebookUrl = 'https://www.facebook.com/ajswimmingacademy';
     String whatsappUrl = 'https://api.whatsapp.com/send/?phone=971586777111&text&app_absent=0';
     String youtubeUrl = 'https://www.youtube.com/channel/UCfayj1kqGZMbYSipOUzqciw';
     String instagramUrl = 'https://www.instagram.com/ajmansocity/';

  return  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
    builder: (context) =>
        Container(
          height: MediaQuery.of(context).size.height *0.4,

          child: Padding(
         padding: EdgeInsets.all(8.0),
            child: Column(
              children: [

                ListTile(
                  onTap:() {
                    Navigator.of(context).pop();
                    makeCall('+971586777111');
                   } ,
                  title: Text(
                    AppLocalizations.of(context).translate('call_us'),
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff0e4c53)
                    ),
                  ),
                  leading: Icon(
                    Icons.call,
                    size: 30.0,
                    color: Colors.deepOrange,
                  ),
                ),


                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    launchURL(facebookUrl);
                  },
                  title: Text(
                    AppLocalizations.of(context).translate('facebook_page'),
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff0e4c53)
                    ),
                  ),
                  leading: Image(
                    image: AssetImage('images/facebook.png'),
                    width: MediaQuery.of(context).size.width *0.1,
                  )
                ),


                ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      launchURL(whatsappUrl);
                    },
                    title: Text(
                      AppLocalizations.of(context).translate('whatsapp'),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff0e4c53)
                      ),
                    ),
                    leading: Image(
                      image: AssetImage('images/whatsapp.png'),
                      width: MediaQuery.of(context).size.width *0.1,
                    )
                ),


                ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      launchURL(youtubeUrl);
                    },
                    title: Text(
                      AppLocalizations.of(context).translate('youtube'),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff0e4c53)
                      ),
                    ),
                    leading: Image(
                      image: AssetImage('images/youtube.png'),
                      width: MediaQuery.of(context).size.width *0.1,
                    )
                ),

                ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      launchURL(instagramUrl);
                    },
                    title: Text(
                      AppLocalizations.of(context).translate('instagram'),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff0e4c53)
                      ),
                    ),
                    leading: Image(
                      image: AssetImage('images/instagram.png'),
                      width: MediaQuery.of(context).size.width *0.1,
                    )
                ),





              ],
            ),
          ),
        ),
  );

}