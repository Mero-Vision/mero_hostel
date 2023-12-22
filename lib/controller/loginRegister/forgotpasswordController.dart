
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

import '../../repo/login_Signin/forgotpasswordapi.dart';

class ForgotPasswordController extends GetxController {
  final Rx<ForgotPasswordModel?> forgotPassData =
      Rx<ForgotPasswordModel?>(null);
  void sendEmail(String email) async {
    final data = await ForgotPasswordApi().sendForgotPassword(email);
    if (data == null) {
      forgotPassData.value = null;
    }
    forgotPassData.value = data;
    Get.defaultDialog(
        content: Obx(() => Text(forgotPassData.value?.message ?? '')));
  }
}
