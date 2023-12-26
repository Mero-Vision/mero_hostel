// To parse this JSON data, do
//
//     final roomsModel = roomsModelFromJson(jsonString);

import 'dart:convert';

RoomsModel roomsModelFromJson(String str) =>
    RoomsModel.fromJson(json.decode(str));

String roomsModelToJson(RoomsModel data) => json.encode(data.toJson());

class RoomsModel {
  List<Datum>? data;

  RoomsModel({
    this.data,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
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
  String? roomNumber;
  String? roomType;
  String? capacity;
  String? availability;
  String? price;
  String? features;
  String? hostelId;
  String? roomImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.roomNumber,
    this.roomType,
    this.capacity,
    this.availability,
    this.price,
    this.features,
    this.hostelId,
    this.roomImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        roomNumber: json["room_number"],
        roomType: json["room_type"],
        capacity: json["capacity"],
        availability: json["availability"],
        price: json["price"],
        features: json["features"],
        hostelId: json["hostel_id"],
        roomImage: json["room_image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "room_type": roomType,
        "capacity": capacity,
        "availability": availability,
        "price": price,
        "features": features,
        "hostel_id": hostelId,
        "room_image": roomImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
