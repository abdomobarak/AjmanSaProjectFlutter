
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/body_provider.dart';
import 'package:ajman_app/src/providers/connectivity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




Widget listenConnection(BuildContext context,Widget myWidget){
  var connectivityProvider = Provider.of<ConnectivityProvider>(context);


  if(connectivityProvider.connectionStatus == 'ConnectivityResult.wifi' ||
      connectivityProvider.connectionStatus == 'ConnectivityResult.mobile'){

    return   myWidget;

  }else{
    return Center(
        child: Text(
          AppLocalizations.of(context).translate('no_internet'),
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),
        )
    );
  }
}