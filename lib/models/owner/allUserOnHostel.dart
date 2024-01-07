// To parse this JSON data, do
//
//     final allUserOnHostel = allUserOnHostelFromJson(jsonString);

import 'dart:convert';

AllUserOnHostel allUserOnHostelFromJson(String str) => AllUserOnHostel.fromJson(json.decode(str));

String allUserOnHostelToJson(AllUserOnHostel data) => json.encode(data.toJson());

class AllUserOnHostel {
    List<Datum>? data;

    AllUserOnHostel({
        this.data,
    });

    factory AllUserOnHostel.fromJson(Map<String, dynamic> json) => AllUserOnHostel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? hostelId;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    String? status;
    String? profileImage;
    DateTime? createdAt;
    DateTime? updatedAt;
    UserRoom? userRoom;

    Datum({
        this.id,
        this.hostelId,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.status,
        this.profileImage,
        this.createdAt,
        this.updatedAt,
        this.userRoom,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hostelId: json["hostel_id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"],
        profileImage: json["profile_image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userRoom: json["user_room"] == null ? null : UserRoom.fromJson(json["user_room"]),
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
        "user_room": userRoom?.toJson(),
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

    UserRoom({
        this.id,
        this.userId,
        this.roomId,
        this.checkInDate,
        this.checkOutDate,
        this.status,
        this.createdAt,
    });

    factory UserRoom.fromJson(Map<String, dynamic> json) => UserRoom(
        id: json["id"],
        userId: json["user_id"],
        roomId: json["room_id"],
        checkInDate: json["check_in_date"] == null ? null : DateTime.parse(json["check_in_date"]),
        checkOutDate: json["check_out_date"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "room_id": roomId,
        "check_in_date": checkInDate?.toIso8601String(),
        "check_out_date": checkOutDate,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
    };
}
