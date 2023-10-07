import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/apis/login_Signin/forgotpasswordapi.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

class ForgotPasswordController extends GetxController {
  //RxList<ForgotPasswordModel> forgotpassworddata = <ForgotPasswordModel>[].obs;
  final Rx<ForgotPasswordModel?> ForgotPassData =
      Rx<ForgotPasswordModel?>(null);
  void sendEmail(String email) async {
    final data = await ForgotPasswordApi().sendforgotpassword(email);
    if (data == null) {
      ForgotPassData.value = null;
    }
    ForgotPassData.value = data;
    Get.defaultDialog(
        content: Obx(() => Text(ForgotPassData.value?.message ?? '')));
  }
}
