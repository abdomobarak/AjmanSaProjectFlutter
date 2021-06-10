// To parse this JSON data, do
//
//     final offers = offersFromJson(jsonString);

import 'dart:convert';

List<Offers> offersFromJson(String str) => List<Offers>.from(json.decode(str).map((x) => Offers.fromJson(x)));

String offersToJson(List<Offers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offers {
  Offers({
    this.offersid,
    this.offerstitle,
    this.offerssubtitle,
    this.offersdescription,
    this.offerimage,
  });

  int offersid;
  String offerstitle;
  String offerssubtitle;
  String offersdescription;
  String offerimage;

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    offersid: json["offersid"],
    offerstitle: json["offerstitle"],
    offerssubtitle: json["offerssubtitle"],
    offersdescription: json["offersdescription"],
    offerimage: json["offerimage"],
  );

  Map<String, dynamic> toJson() => {
    "offersid": offersid,
    "offerstitle": offerstitle,
    "offerssubtitle": offerssubtitle,
    "offersdescription": offersdescription,
    "offerimage": offerimage,
  };
}
