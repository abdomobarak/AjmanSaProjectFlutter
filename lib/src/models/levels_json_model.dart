

import 'dart:convert';

List<Levels> levelsFromJson(String str) => List<Levels>.from(json.decode(str).map((x) => Levels.fromJson(x)));

String levelsToJson(List<Levels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Levels {
  Levels({
    this.levelid,
    this.leveltitle,
    this.levelstages,
  });

  int levelid;
  String leveltitle;
  int levelstages;

  factory Levels.fromJson(Map<String, dynamic> json) => Levels(
    levelid: json["levelid"],
    leveltitle: json["leveltitle"],
    levelstages: json["levelstages"],
  );

  Map<String, dynamic> toJson() => {
    "levelid": levelid,
    "leveltitle": leveltitle,
    "levelstages": levelstages,
  };
}
