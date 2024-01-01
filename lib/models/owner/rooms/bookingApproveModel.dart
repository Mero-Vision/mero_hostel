// To parse this JSON data, do
//
//     final bookingApproveModel = bookingApproveModelFromJson(jsonString);

import 'dart:convert';

BookingApproveModel bookingApproveModelFromJson(String str) => BookingApproveModel.fromJson(json.decode(str));

String bookingApproveModelToJson(BookingApproveModel data) => json.encode(data.toJson());

class BookingApproveModel {
    Data? data;
    String? message;

    BookingApproveModel({
        this.data,
        this.message,
    });

    factory BookingApproveModel.fromJson(Map<String, dynamic> json) => BookingApproveModel(
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
    int? userId;
    int? hostelId;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.userId,
        this.hostelId,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        hostelId: json["hostel_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "hostel_id": hostelId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
