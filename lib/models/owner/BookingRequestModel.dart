// To parse this JSON data, do
//
//     final bookingRequestModel = bookingRequestModelFromJson(jsonString);

import 'dart:convert';

BookingRequestModel bookingRequestModelFromJson(String str) =>
    BookingRequestModel.fromJson(json.decode(str));

String bookingRequestModelToJson(BookingRequestModel data) =>
    json.encode(data.toJson());

class BookingRequestModel {
  List<Datum>? data;

  BookingRequestModel({
    this.data,
  });

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) =>
      BookingRequestModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? email;
  String? requested;

  Datum({
    this.id,
    this.name,
    this.email,
    this.requested,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        requested: json["requested"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "requested": requested,
      };
}
