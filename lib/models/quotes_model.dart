// To parse this JSON data, do
//
//     final QuotesModel = QuotesModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<QuotesModel> QuotesModelFromJson(String str) => List<QuotesModel>.from(
    json.decode(str).map((x) => QuotesModel.fromJson(x)));

String QuotesModelToJson(List<QuotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
  int? id;
  String? quote;
  String? author;
  DateTime? timestamp;

  QuotesModel({
    this.id,
    this.quote,
    this.author,
    this.timestamp,
  });

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
        "timestamp": timestamp?.toIso8601String(),
      };
}
