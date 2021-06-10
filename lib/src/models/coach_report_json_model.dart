

import 'dart:convert';

List<CoachNotes> coachNotesFromJson(String str) => List<CoachNotes>.from(json.decode(str).map((x) => CoachNotes.fromJson(x)));

String coachNotesToJson(List<CoachNotes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoachNotes {
  CoachNotes({
    this.reportid,
    this.stagetitle,
    this.studentid,
    this.percentage,
  });

  int reportid;
  String stagetitle;
  int studentid;
  int percentage;

  factory CoachNotes.fromJson(Map<String, dynamic> json) => CoachNotes(
    reportid: json["reportid"],
    stagetitle: json["stagetitle"],
    studentid: json["studentid"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "reportid": reportid,
    "stagetitle": stagetitle,
    "studentid": studentid,
    "percentage": percentage,
  };
}
