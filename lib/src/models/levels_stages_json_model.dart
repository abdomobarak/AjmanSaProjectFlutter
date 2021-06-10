

import 'dart:convert';

List<Stages> stagesFromJson(String str) => List<Stages>.from(json.decode(str).map((x) => Stages.fromJson(x)));

String stagesToJson(List<Stages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stages {
  Stages({
    this.stageid,
    this.stagetitle,
    this.leveltitle,
  });

  int stageid;
  String stagetitle;
  String leveltitle;

  factory Stages.fromJson(Map<String, dynamic> json) => Stages(
    stageid: json["stageid"],
    stagetitle: json["stagetitle"],
    leveltitle: json["leveltitle"],
  );

  Map<String, dynamic> toJson() => {
    "stageid": stageid,
    "stagetitle": stagetitle,
    "leveltitle": leveltitle,
  };
}
