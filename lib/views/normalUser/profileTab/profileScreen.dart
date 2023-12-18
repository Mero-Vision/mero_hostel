// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';

import 'package:mero_hostel/views/normalUser/profileTab/widgets/topsection.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final User? userData;
  LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  controller.Logout();
                },
                icon: Icon(
                  Icons.login_outlined,
                  size: 35.h,
                ).marginOnly(right: 10.h))
          ],
        ),
        body: ProfileTopSection(
          profileImage: userData?.name ?? 'hello',
          userName: userData?.name ?? 'No name',
          userEmail: userData?.email ?? 'email not found',
        ));
  }
}
