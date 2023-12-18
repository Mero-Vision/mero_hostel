import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/SplashScreen.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/hostelOwner/Hostel_Owner.dart';
import 'package:mero_hostel/views/normalUser/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repo/login_Signin/loginRepo.dart';

class LoginController extends GetxController {
  final LoginRepo repo = LoginRepo();
  @override
  void onInit() {
    checkLoginStatus();
    // TODO: implement onInit
    super.onInit();
  }

  final isLoading = false.obs;
  //
  final Rx<UserModel?>? user = Rx<UserModel?>(null);
  RxBool IsLoggedIn = false.obs;
//
  Future checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var user_status = preferences.getString('UserStatus');

    if (user_status != '' && user_status == 'Hostel_Owner') {
      var email = preferences.getString('userEmail');
      var password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);
      Get.offAll(() => HostelOwner(
            userData: data!.data.user,
          ));
    } else if (user_status != '' && user_status == 'Hostel_User') {
      var email = preferences.getString('userEmail');
      var password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);
      // Get.offAll(() => HostelOwner(
      //       userData: data!.data.user,
      //     ));
    } else if (user_status != '' && user_status == 'Normal_User') {
      var email = preferences.getString('userEmail');
      var password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);
      IsLoggedIn.value = true;

      Get.offAll(() => BottomNavBar(
            userValue: data?.data.user,
          ));
    } else {
      await Future.delayed(
        Duration(milliseconds: 1500),
      );
      Get.offAll(() => BottomNavBar());
    }
  }

  void Logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userEmail', '');
    preferences.setString('userPassword', '');
    preferences.setString('UserStatus', '');
    IsLoggedIn.value = false;
    Get.offAll(() => SplashScreen());
  }

  Future login(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isLoading(true);
    final data = await repo.userLogin(email, password);
    preferences.setString('userEmail', email);
    preferences.setString('userPassword', password);
    if (data == null) {
      user?.value = null;
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
      isLoading(false);
    } else {
      isLoading(false);
      user?.value = data;

      if (data.data.user.status == 'Hostel_Owner') {
        preferences.setString('UserStatus', 'Hostel_Owner');
        IsLoggedIn.value = true;
        Get.offAll(() => HostelOwner(
              userData: data.data.user,
            ));
      }

      if (data.data.user.status == null) {
        preferences.setString('UserStatus', 'Normal_User');
        checkLoginStatus();
      }
      print('success');
    }
  }
}
