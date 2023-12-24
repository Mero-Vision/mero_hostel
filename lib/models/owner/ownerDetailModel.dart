// To parse this JSON data, do
//
//     final ownerDetailModel = ownerDetailModelFromJson(jsonString);

import 'dart:convert';

OwnerDetailModel ownerDetailModelFromJson(String str) =>
    OwnerDetailModel.fromJson(json.decode(str));

String ownerDetailModelToJson(OwnerDetailModel data) =>
    json.encode(data.toJson());

class OwnerDetailModel {
  List<Datum>? data;

  OwnerDetailModel({
    this.data,
  });

  factory OwnerDetailModel.fromJson(Map<String, dynamic> json) =>
      OwnerDetailModel(
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
  String? hostelName;
  String? hostelType;
  String? slug;
  String? address;
  String? phoneNumber;
  String? email;
  String? website;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? hostelImages;
  User? user;

  Datum({
    this.id,
    this.hostelName,
    this.hostelType,
    this.slug,
    this.address,
    this.phoneNumber,
    this.email,
    this.website,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.hostelImages,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hostelName: json["hostel_name"],
        hostelType: json["hostel_type"],
        slug: json["slug"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        website: json["website"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        hostelImages: json["hostel_images"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hostel_name": hostelName,
        "hostel_type": hostelType,
        "slug": slug,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
        "website": website,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hostel_images": hostelImages,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
