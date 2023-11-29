import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/home/widget/bottomNavBar.dart';


import '../repo/login_Signin/loginRepo.dart';

class LoginController extends GetxController {
  final LoginRepo repo = LoginRepo();
  final isLoading = false.obs;
  //
  final Rx<UserModel?> user = Rx<UserModel?>(null);
//

  Future login(String email, String password) async {
    isLoading(true);
    final data = await repo.userLogin(email, password);
    if (data == null) {
      user.value = null;
      Get.snackbar("Oops!", "Invalid Credentials ",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade300,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeIn,
          duration: Duration(seconds: 3));
      isLoading(false);
    } else {
      isLoading(false);
      user.value = data;
      Get.to(() => BottomNavBar());
    }
  }
}
