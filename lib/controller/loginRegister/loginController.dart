// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/SplashScreen.dart';
import 'package:mero_hostel/controller/userController.dart/userController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/hostelOwner/pages/Hostel_Owner.dart';
import 'package:mero_hostel/views/normalUser/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repo/login_Signin/loginRepo.dart';

class LoginController extends GetxController {
  final LoginRepo repo = LoginRepo();
  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  final isLoading = false.obs;
  Rx<String?> userStatus = ''.obs;
  //
  final Rx<LoginUserModel?>? user = Rx<LoginUserModel?>(null);
  RxBool isLoggedIn = false.obs;
//
  Future checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var user_status = preferences.getString('UserStatus');
    if (user_status != null) {
      userStatus.value = user_status;
    }
    if (user_status != '' && user_status == 'Hostel_Owner') {
      var email = preferences.getString('userEmail');
      var password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);
      await preferences.setString('AccessToken', data!.data.token);
      var accessToken = preferences.getString('AccessToken');

      //   AuthApi(accessToken: accessToken);
      if (data.data.user.status == 'Hostel_Owner') {
        var userData = await UserController().getUserInfo(
            accessToken: accessToken!, userId: data.data.user.id.toString());
        isLoggedIn.value = true;
        Get.offAll(() => HostelOwner(
              userDataModel: userData,
            ));
      } else {
        await preferences.setString('UserStatus', '');
        checkLoginStatus();
      }
    } else if (user_status != '' && user_status == 'Hostel_User') {
      var email = preferences.getString('userEmail');
      var password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);
      await preferences.setString('AccessToken', data!.data.token);
      var accessToken = preferences.getString('AccessToken');
      UserController().getUserInfo(
          accessToken: accessToken!, userId: data.data.user.id.toString());
      //  AuthApi(accessToken: accessToken);

      // Get.offAll(() { HostelOwner(
      //       userData: data!.data.user,
      //     );
      // isLoading.value = true;});
    } else if (user_status != '' && user_status == 'Normal_User') {
      var email = preferences.getString('userEmail');
      var password = preferences.getString('userPassword');
      final data = await repo.userLogin(email!, password!);
      preferences.setString('AccessToken', data!.data.token);
      var accessToken = preferences.getString('AccessToken');
      //  AuthApi(accessToken: accessToken);
      var userData = await UserController().getUserInfo(
          accessToken: accessToken!, userId: data.data.user.id.toString());
      isLoggedIn.value = true;
      Get.offAll(() => BottomNavBar(
            userValue: userData.data,
          ));
    } else {
      await Future.delayed(
        const Duration(milliseconds: 1500),
      );
      Get.offAll(() => BottomNavBar());
    }
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userEmail', '');
    preferences.setString('userPassword', '');
    preferences.setString('UserStatus', '');
    preferences.setString('AccessToken', '');
    isLoggedIn.value = false;
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

      preferences.setString('AccessToken', data.data.token);
      String? accessToken = preferences.getString('AccessToken');
      var userdata = await UserController().getUserInfo(
          accessToken: accessToken!, userId: data.data.user.id.toString());
      // AuthApi(accessToken: accessToken);

      if (data.data.user.status == 'Hostel_Owner') {
        preferences.setString('UserStatus', 'Hostel_Owner');
        var user_status = preferences.getString('UserStatus');
        userStatus.value = user_status;

        isLoggedIn.value = true;

        Get.offAll(() => HostelOwner(
              userDataModel: userdata,
            ));
      }

      if (data.data.user.status == null) {
        await preferences.setString('UserStatus', 'Normal_User');
        
        checkLoginStatus();
      }
      print('success');
      print(isLoggedIn.value.toString());
    }
  }
}
