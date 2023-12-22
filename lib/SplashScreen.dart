// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  LoginController controller = Get.put(LoginController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    controller.checkLoginStatus();
    return Scaffold(
      body: Center(
          child: SizedBox(
              height: 150.h,
              width: 250.h,
              child: Image.asset('assets/images/MainRectangleLogo.png'))),
    );
  }
}
