// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  Data? data;

  UserDataModel({
    this.data,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  int? hostelId;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? status;
  String? profileImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.hostelId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        hostelId: json["hostel_id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        profileImage: json["profile_image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hostel_id": hostelId,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "status": status,
        "profile_image": profileImage,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
