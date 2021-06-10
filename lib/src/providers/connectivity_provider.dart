
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ConnectivityProvider with ChangeNotifier{

  String connectionStatus ;
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubscription;


  ConnectivityProvider(){

    initConnectivity().then((value) {
      connectivitySubscription =
          connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
      notifyListeners();
    });

  }



  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return _updateConnectionStatus(result);
  }





  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        connectionStatus = result.toString();
        notifyListeners();
        break;
      default:
        connectionStatus = 'Failed to get connectivity.';
        notifyListeners();
        break;
    }
  }



}