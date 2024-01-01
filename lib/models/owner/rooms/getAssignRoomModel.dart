// To parse this JSON data, do
//
//     final getAssignRoomModel = getAssignRoomModelFromJson(jsonString);

import 'dart:convert';

GetAssignRoomModel getAssignRoomModelFromJson(String str) => GetAssignRoomModel.fromJson(json.decode(str));

String getAssignRoomModelToJson(GetAssignRoomModel data) => json.encode(data.toJson());

class GetAssignRoomModel {
    List<Datum>? data;

    GetAssignRoomModel({
        this.data,
    });

    factory GetAssignRoomModel.fromJson(Map<String, dynamic> json) => GetAssignRoomModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? roomNumber;
    String? roomType;
    String? roomCapacity;
    List<UserRoom>? userRooms;

    Datum({
        this.id,
        this.roomNumber,
        this.roomType,
        this.roomCapacity,
        this.userRooms,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        roomNumber: json["room_number"],
        roomType: json["room_type"],
        roomCapacity: json["room_capacity"],
        userRooms: json["user_rooms"] == null ? [] : List<UserRoom>.from(json["user_rooms"]!.map((x) => UserRoom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "room_type": roomType,
        "room_capacity": roomCapacity,
        "user_rooms": userRooms == null ? [] : List<dynamic>.from(userRooms!.map((x) => x.toJson())),
    };
}

class UserRoom {
    int? id;
    int? userId;
    int? roomId;
    DateTime? checkInDate;
    dynamic checkOutDate;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? userName;

    UserRoom({
        this.id,
        this.userId,
        this.roomId,
        this.checkInDate,
        this.checkOutDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userName,
    });

    factory UserRoom.fromJson(Map<String, dynamic> json) => UserRoom(
        id: json["id"],
        userId: json["user_id"],
        roomId: json["room_id"],
        checkInDate: json["check_in_date"] == null ? null : DateTime.parse(json["check_in_date"]),
        checkOutDate: json["check_out_date"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "room_id": roomId,
        "check_in_date": checkInDate?.toIso8601String(),
        "check_out_date": checkOutDate,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_name": userName,
    };
}
