

import 'dart:convert';

List<AttendReportJson> attendReportFromJson(String str) => List<AttendReportJson>.from(json.decode(str).map((x) => AttendReportJson.fromJson(x)));

String attendReportToJson(List<AttendReportJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendReportJson {
  AttendReportJson({
    this.attendanceid,
    this.attendanceday,
    this.attendance,
    this.studentid,
  });

  int attendanceid;
  String attendanceday;
  int attendance;
  int studentid;

  factory AttendReportJson.fromJson(Map<String, dynamic> json) => AttendReportJson(
    attendanceid: json["attendanceid"],
    attendanceday: json["attendanceday"],
    attendance: json["attendance"],
    studentid: json["studentid"],
  );

  Map<String, dynamic> toJson() => {
    "attendanceid": attendanceid,
    "attendanceday": attendanceday,
    "attendance": attendance,
    "studentid": studentid,
  };
}
