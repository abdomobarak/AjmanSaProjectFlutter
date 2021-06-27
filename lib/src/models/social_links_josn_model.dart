// To parse this JSON data, do
//
//     final socialLinksJsonModel = socialLinksJsonModelFromJson(jsonString);

import 'dart:convert';

List<SocialLinksJsonModel> socialLinksJsonModelFromJson(String str) => List<SocialLinksJsonModel>.from(json.decode(str).map((x) => SocialLinksJsonModel.fromJson(x)));

String socialLinksJsonModelToJson(List<SocialLinksJsonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocialLinksJsonModel {
  SocialLinksJsonModel({
    this.socialid,
    this.socialname,
    this.sociallink,
  });

  int socialid;
  String socialname;
  String sociallink;

  factory SocialLinksJsonModel.fromJson(Map<String, dynamic> json) => SocialLinksJsonModel(
    socialid: json["socialid"],
    socialname: json["socialname"],
    sociallink: json["sociallink"],
  );

  Map<String, dynamic> toJson() => {
    "socialid": socialid,
    "socialname": socialname,
    "sociallink": sociallink,
  };
}
