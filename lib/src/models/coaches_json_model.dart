

import 'dart:convert';

List<Coachs> coachsFromJson(String str) => List<Coachs>.from(json.decode(str).map((x) => Coachs.fromJson(x)));

String coachsToJson(List<Coachs> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coachs {
  Coachs({
    this.coachid,
    this.coachname,
    this.coachimage,
    this.coachbio,
  });

  int coachid;
  String coachname;
  String coachimage;
  String coachbio;

  factory Coachs.fromJson(Map<String, dynamic> json) => Coachs(
    coachid: json["coachid"],
    coachname: json["coachname"],
    coachimage: json["coachimage"],
    coachbio: json["coachbio"],
  );

  Map<String, dynamic> toJson() => {
    "coachid": coachid,
    "coachname": coachname,
    "coachimage": coachimage,
    "coachbio": coachbio,
  };
}
