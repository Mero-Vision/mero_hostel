import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/database/login_Signin/loginRepo.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/home/homepage.dart';

class LoginController extends GetxController {
  final LoginRepo repo = LoginRepo();
  //
  final Rx<UserModel?> user = Rx<UserModel?>(null);
//

  Future login(String email, String password) async {
    final data = await repo.userLogin(email, password);
    if (data != null) {
      user.value = data;
      Get.to(() => HomePage());
    } else {
      user.value = null;
      // Get.snackbar(
      //   "Oops!",
      //   "Invalid Credentials ",
      //   icon: Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red.shade300,
      //   borderRadius: 20,
      //   margin: EdgeInsets.all(15),
      //   colorText: Colors.white,
      //   duration: Duration(seconds: 3),
      //   isDismissible: true,
      //   forwardAnimationCurve: Curves.ease,
      // );
    }
  }
}
