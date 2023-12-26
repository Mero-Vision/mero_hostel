// To parse this JSON data, do
//
//     final createRoomsModel = createRoomsModelFromJson(jsonString);

import 'dart:convert';

CreateRoomsModel createRoomsModelFromJson(String str) =>
    CreateRoomsModel.fromJson(json.decode(str));

String createRoomsModelToJson(CreateRoomsModel data) =>
    json.encode(data.toJson());

class CreateRoomsModel {
  Data? data;
  String? message;

  CreateRoomsModel({
    this.data,
    this.message,
  });

  factory CreateRoomsModel.fromJson(Map<String, dynamic> json) =>
      CreateRoomsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
