// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    List<Datum>? data;

    SearchModel({
        this.data,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    int? userId;
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    dynamic hostelId;
    String? name;
    String? email;
    DateTime? emailVerifiedAt;
    String? status;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    User({
        this.id,
        this.hostelId,
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
        hostelId: json["hostel_id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hostel_id": hostelId,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
