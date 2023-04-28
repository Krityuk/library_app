// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  String book_id;
  String book_name;
  String book_count;

  BookModel({
    required this.book_id,
    required this.book_name,
    required this.book_count,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        book_id: json["book_id"],
        book_name: json["book_name"],
        book_count: json["book_count"],
      );

  Map<String, dynamic> toJson() => {
        "book_id": book_id,
        "book_name": book_name,
        "book_count": book_count,
      };
}
