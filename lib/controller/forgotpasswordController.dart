import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/api/forgotpasswordapi.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

class ForgotPasswordController extends GetxController {
  RxList<ForgotPasswordModel> forgotpassworddata = <ForgotPasswordModel>[].obs;

  void sendEmail(String email) async {
    final data = await ForgotPasswordApi().sendforgotpassword(email);
    if (data != null) {
      Get.defaultDialog(content: Text('hello'));
    }
  }
}
