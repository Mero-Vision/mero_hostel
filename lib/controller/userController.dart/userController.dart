import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/repo/user/changeStatus.dart';
import 'package:mero_hostel/repo/user/editProfileRepo.dart';
import 'package:mero_hostel/repo/user/get_user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  UserDataModel? userData;

  Future<UserDataModel> getUserInfo(
      {required String? accessToken, required String userId}) async {
    if (accessToken != null) {
      var data = await GetUserData()
          .getUserInfo(accessToken: accessToken, userId: userId);
      userData = data;
      update();
      return data;
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('AccessToken');
      var data =
          await GetUserData().getUserInfo(accessToken: token!, userId: userId);
      userData = data;
      update();
      return data;
    }
  }

  Future<UserDataModel> editUserProfile({
    required String newName,
    required String newEmail,
    required File? newProfile,
    required String userId,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('AccessToken');
    var newData = await EditProfileRepo().editProfileRequest(
        newName: newName,
        userId: userId,
        newEmail: newEmail,
        newProfile: newProfile,
        token: token!);
    if (newData != null) {
      Get.defaultDialog(
          title: 'SuccessFully Changed', content: Text('Profile Data Changed'));
      preferences.setString('userEmail', newData.data!.email!);
      LoginController().checkLoginStatus();
    }

    return newData!;
  }

  Future<bool> changeUserStatus(
      String email, String status, String token) async {
    var data = await ChangeUserStatus().sendChangeRequest(email, status, token);

    return data;
  }
}
