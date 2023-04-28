// To parse this JSON data, do
//
//     final accountsModel = accountsModelFromJson(jsonString);

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

accountsModel accountsModelFromJson(String str) =>
    accountsModel.fromJson(json.decode(str));

String accountsModelToJson(accountsModel data) => json.encode(data.toJson());

class accountsModel {
  String id;
  String name;
  String book_id;
  String issueDate;
  String password;

  accountsModel({
    required this.id,
    required this.name,
    required this.book_id,
    required this.issueDate,
    required this.password,
  });

  factory accountsModel.fromJson(Map<String, dynamic> json) => accountsModel(
        id: json["id"],
        name: json["name"],
        book_id: json["book_id"],
        issueDate: json["issue_date"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "book_id": book_id,
        "issue_date": issueDate,
        "password": password,
      };
}
