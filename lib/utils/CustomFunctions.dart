



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class CustomFunctions {


  SharedPreferences preferences;


    Future<String> getMYLocal(BuildContext context)async{
      preferences = await SharedPreferences.getInstance();
      String myLocal = preferences.getString('ajmanLocal');

    if(myLocal != null || myLocal != ''){
      return myLocal;
    }else {

      return null;
    }

  }


  static  launchMap( lat, lng) async {
    var url = '';
    var urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = "https://www.google.com/maps/search/?api=1&query=${lat},${lng}";
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
      url = "comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else if (await canLaunch(urlAppleMaps)) {
      await launch(urlAppleMaps);
    } else {
      throw 'Could not launch $url';
    }
  }


}