// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/SplashScreen.dart';
import 'package:mero_hostel/controller/userController.dart/userController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/repo/login_Signin/loginRepo.dart';
import 'package:mero_hostel/views/hostelOwner/pages/Hostel_Owner.dart';
import 'package:mero_hostel/views/hostel_user/hostel_user_home.dart';
import 'package:mero_hostel/views/normalUser/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginRepo repo = LoginRepo();
  final isLoading = false.obs;
  final Rx<String?> userStatus = ''.obs;
  final Rx<LoginUserModel?> user = Rx<LoginUserModel?>(null);
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
    final preferences = await SharedPreferences.getInstance();
    final userStatus = preferences.getString('UserStatus');

    if (userStatus == 'Hostel_Owner' ||
        userStatus == 'Hostel_User' ||
        userStatus == 'Normal_User') {
      final email = preferences.getString('userEmail');
      final password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);

      preferences.setString('AccessToken', data!.data.token);
      final accessToken = preferences.getString('AccessToken');

      if (data.data.user.status == 'Hostel_Owner') {
        isLoggedIn.value = true;
        final userData = await UserController().getUserInfo(
            accessToken: accessToken!, userId: data.data.user.id.toString());
        Get.offAll(() => HostelOwner(userDataModel: userData));
      } else if (data.data.user.status == 'Hostel_User') {
        isLoggedIn.value = true;
        final userData = await UserController().getUserInfo(
            accessToken: accessToken!, userId: data.data.user.id.toString());
        Get.offAll(() => HostelUserHomePage());
      } else {
        isLoggedIn.value = true;
        final userData = await UserController().getUserInfo(
            accessToken: accessToken!, userId: data.data.user.id.toString());
        Get.offAll(() => BottomNavBar(userValue: userData.data));
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 1500));
      Get.offAll(() => BottomNavBar());
    }
  }

  void logout() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('userEmail', '');
    preferences.setString('userPassword', '');
    preferences.setString('UserStatus', '');
    preferences.setString('AccessToken', '');
    isLoggedIn.value = false;
    Get.offAll(() => SplashScreen());
  }

  Future<void> login(String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    isLoading(true);
    final data = await repo.userLogin(email, password);
    preferences.setString('userEmail', email);
    preferences.setString('userPassword', password);

    if (data == null) {
      user.value = null;
      Get.snackbar(
        "Oops!",
        "Invalid Credentials",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade300,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        forwardAnimationCurve: Curves.easeIn,
        reverseAnimationCurve: Curves.easeIn,
        duration: const Duration(seconds: 3),
      );
      isLoading(false);
    } else {
      isLoading(false);
      user.value = data;
      preferences.setString('AccessToken', data.data.token);
      final accessToken = preferences.getString('AccessToken');
      final userData = await UserController().getUserInfo(
          accessToken: accessToken!, userId: data.data.user.id.toString());

      if (data.data.user.status == 'Hostel_Owner') {
        preferences.setString('UserStatus', 'Hostel_Owner');
        userStatus.value = 'Hostel_Owner';
        isLoggedIn.value = true;
        Get.offAll(() => HostelOwner(userDataModel: userData));
      } else if (data.data.user.status == 'Hostel_User') {
        preferences.setString('UserStatus', 'Hostel_User');
        userStatus.value = 'Hostel_User';
        isLoggedIn.value = true;
        Get.offAll(() => HostelUserHomePage());
      } else {
        preferences.setString('UserStatus', 'Normal_User');
        checkLoginStatus();
      }
      print('success');
      print(isLoggedIn.value.toString());
    }
  }
}
