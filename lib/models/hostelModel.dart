// To parse this JSON data, do
//
//     final hostelModel = hostelModelFromJson(jsonString);

import 'dart:convert';

HostelModel hostelModelFromJson(String str) => HostelModel.fromJson(json.decode(str));

String hostelModelToJson(HostelModel data) => json.encode(data.toJson());

class HostelModel {
    List<Datum>? data;

    HostelModel({
        this.data,
    });

    factory HostelModel.fromJson(Map<String, dynamic> json) => HostelModel(
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
    String? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? hostelImages;

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
    };
}
