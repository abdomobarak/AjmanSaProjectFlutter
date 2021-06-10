// To parse this JSON data, do
//
//     final children = childrenFromJson(jsonString);

import 'dart:convert';

List<Children> childrenFromJson(String str) => List<Children>.from(json.decode(str).map((x) => Children.fromJson(x)));

String childrenToJson(List<Children> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Children {
  Children({
    this.studentid,
    this.studentname,
    this.studentaddress,
    this.studentgender,
    this.studentimage,
    this.studentbirthDate,
    this.studentjoindate,
    this.studentlevel,
    this.studentcoach,
    this.studentgroup,
    this.username,
    this.password,
  });

  int studentid;
  String studentname;
  String studentaddress;
  String studentgender;
  String studentimage;
  DateTime studentbirthDate;
  DateTime studentjoindate;
  String studentlevel;
  String studentcoach;
  String studentgroup;
  String username;
  String password;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
    studentid: json["studentid"],
    studentname: json["studentname"],
    studentaddress: json["studentaddress"],
    studentgender: json["studentgender"],
    studentimage: json["studentimage"],
    studentbirthDate: DateTime.parse(json["studentbirthDate"]),
    studentjoindate: DateTime.parse(json["studentjoindate"]),
    studentlevel: json["studentlevel"],
    studentcoach: json["studentcoach"],
    studentgroup: json["studentgroup"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "studentid": studentid,
    "studentname": studentname,
    "studentaddress": studentaddress,
    "studentgender": studentgender,
    "studentimage": studentimage,
    "studentbirthDate": studentbirthDate.toIso8601String(),
    "studentjoindate": studentjoindate.toIso8601String(),
    "studentlevel": studentlevel,
    "studentcoach": studentcoach,
    "studentgroup": studentgroup,
    "username": username,
    "password": password,
  };
}
