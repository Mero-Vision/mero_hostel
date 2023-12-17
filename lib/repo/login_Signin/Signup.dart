import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/repo/apis/api.dart';

class SignupUser {
  Api api = Api();
  Future<bool> postRegistration(String name, String email, String password,
      String confirmPassword) async {
    try {
      var response = await api.sendRequest.post(
        '/users',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword
        },
      );
      if (response.statusCode == 201) {
        Get.snackbar("Great!", "Account Created ",
            icon: const Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            forwardAnimationCurve: Curves.easeIn,
            reverseAnimationCurve: Curves.easeIn,
            duration: const Duration(seconds: 3));
        return true;
      } else {
        Get.snackbar("Oops!", "Something Went Wrong ",
            icon: const Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade300,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            forwardAnimationCurve: Curves.easeIn,
            reverseAnimationCurve: Curves.easeIn,
            duration: const Duration(seconds: 3));
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }
}
