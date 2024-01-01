// To parse this JSON data, do
//
//     final userAssignedMsgModel = userAssignedMsgModelFromJson(jsonString);

import 'dart:convert';

UserAssignedMsgModel userAssignedMsgModelFromJson(String str) => UserAssignedMsgModel.fromJson(json.decode(str));

String userAssignedMsgModelToJson(UserAssignedMsgModel data) => json.encode(data.toJson());

class UserAssignedMsgModel {
    Data? data;
    String? message;

    UserAssignedMsgModel({
        this.data,
        this.message,
    });

    factory UserAssignedMsgModel.fromJson(Map<String, dynamic> json) => UserAssignedMsgModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    String? roomId;
    String? userId;
    DateTime? checkInDate;
    String? status;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.roomId,
        this.userId,
        this.checkInDate,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        roomId: json["room_id"],
        userId: json["user_id"],
        checkInDate: json["check_in_date"] == null ? null : DateTime.parse(json["check_in_date"]),
        status: json["status"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "user_id": userId,
        "check_in_date": checkInDate?.toIso8601String(),
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
