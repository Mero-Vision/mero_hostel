// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/repo/apis/api.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';

class LoginRepo {
  final Api _api = Api();
  Future<LoginUserModel?> userLogin(String email, String password) async {
    try {
      final response = await _api.sendRequest.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final resultData = jsonDecode(response.toString());
        final userModel = LoginUserModel.fromJson(resultData);

        return userModel;
      } else {
        // Handle non-200 status codes
        Get.snackbar("Oops!", "Invalid Credentials ",
            icon: const Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade300,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            forwardAnimationCurve: Curves.easeIn,
            reverseAnimationCurve: Curves.easeIn,
            duration: const Duration(seconds: 3));
      }
    } catch (error) {
      // Handle Dio errors
    }
  }
}
