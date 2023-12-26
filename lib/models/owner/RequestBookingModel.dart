// To parse this JSON data, do
//
//     final requestBookingModel = requestBookingModelFromJson(jsonString);

import 'dart:convert';

RequestBookingModel requestBookingModelFromJson(String str) => RequestBookingModel.fromJson(json.decode(str));

String requestBookingModelToJson(RequestBookingModel data) => json.encode(data.toJson());

class RequestBookingModel {
    Data? data;
    String? message;

    RequestBookingModel({
        this.data,
        this.message,
    });

    factory RequestBookingModel.fromJson(Map<String, dynamic> json) => RequestBookingModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    int? userId;
    int? hostelId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.userId,
        this.hostelId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        hostelId: json["hostel_id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "hostel_id": hostelId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
