// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
    bool data;
    String message;

    ForgotPasswordModel({
        required this.data,
        required this.message,
    });

    factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
        data: json["data"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
    };
}
