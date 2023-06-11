// To parse this JSON data, do
//
//     final claim = claimFromJson(jsonString);

import 'dart:convert';

import 'package:hackapp/models/user.dart';

Claim claimFromJson(String str) => Claim.fromJson(json.decode(str));

String claimToJson(Claim data) => json.encode(data.toJson());

List<Claim> ClaimListFromJson(String str) =>
    List<Claim>.from(json.decode(str).map((x) => Claim.fromJson(x)));

class Claim {
  String? typeClaim;
  String subject;
  String contenu;
  DateTime? dateClaim;
  String? decision;
  int claimId;

  Claim({
    this.typeClaim,
    required this.subject,
    required this.contenu,
    this.dateClaim,
    this.decision,
    required this.claimId,
  });

  factory Claim.fromJson(Map<String, dynamic> json) => Claim(
        typeClaim: json["typeClaim"],
        subject: json["subject"],
        contenu: json["contenu"],
        dateClaim: DateTime.parse(json["dateClaim"]),
        decision: json["decision"],
        claimId: json["claimId"],
      );

  Map<String, dynamic> toJson() => {
        "typeClaim": typeClaim,
        "subject": subject,
        "contenu": contenu,
        "dateClaim": dateClaim,
        "decision": decision,
        "claimId": claimId,
      };
}
