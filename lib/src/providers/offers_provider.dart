import 'package:ajman_app/src/models/offers_json_model.dart';
import 'package:ajman_app/src/resources/apis/offers_api.dart';
import 'package:flutter/material.dart';

class OffersProvider with ChangeNotifier{

  List<Offers> offersList;

  OffersProvider(){
    getOffers().then((value) {
      offersList = [];
      if(value != null){
        offersList.addAll(value);
        notifyListeners();
      }
    });
  }
}