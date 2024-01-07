// To parse this JSON data, do
//
//     final hostelUserDataModel = hostelUserDataModelFromJson(jsonString);

import 'dart:convert';

HostelUserDataModel hostelUserDataModelFromJson(String str) =>
    HostelUserDataModel.fromJson(json.decode(str));

String hostelUserDataModelToJson(HostelUserDataModel data) =>
    json.encode(data.toJson());

class HostelUserDataModel {
  List<Datum>? data;

  HostelUserDataModel({
    this.data,
  });

  factory HostelUserDataModel.fromJson(Map<String, dynamic> json) =>
      HostelUserDataModel(
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
  int? hostelId;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? roomId;
  DateTime? checkInDate;
  dynamic checkOutDate;
  String? roomNumber;
  String? roomType;
  String? capacity;
  String? availability;
  String? price;
  String? features;
  String? hostelName;
  String? hostelType;
  String? slug;
  String? address;
  String? phoneNumber;
  String? website;
  dynamic location;
  dynamic floor;

  Datum({
    this.id,
    this.hostelId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.roomId,
    this.checkInDate,
    this.checkOutDate,
    this.roomNumber,
    this.roomType,
    this.capacity,
    this.availability,
    this.price,
    this.features,
    this.hostelName,
    this.hostelType,
    this.slug,
    this.address,
    this.phoneNumber,
    this.website,
    this.location,
    this.floor,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hostelId: json["hostel_id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        roomId: json["room_id"],
        checkInDate: json["check_in_date"] == null
            ? null
            : DateTime.parse(json["check_in_date"]),
        checkOutDate: json["check_out_date"],
        roomNumber: json["room_number"],
        roomType: json["room_type"],
        capacity: json["capacity"],
        availability: json["availability"],
        price: json["price"],
        features: json["features"],
        hostelName: json["hostel_name"],
        hostelType: json["hostel_type"],
        slug: json["slug"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        website: json["website"],
        location: json["location"],
        floor: json["floor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hostel_id": hostelId,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "room_id": roomId,
        "check_in_date": checkInDate?.toIso8601String(),
        "check_out_date": checkOutDate,
        "room_number": roomNumber,
        "room_type": roomType,
        "capacity": capacity,
        "availability": availability,
        "price": price,
        "features": features,
        "hostel_name": hostelName,
        "hostel_type": hostelType,
        "slug": slug,
        "address": address,
        "phone_number": phoneNumber,
        "website": website,
        "location": location,
        "floor": floor,
      };
}
