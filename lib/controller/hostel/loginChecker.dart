import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    controller.checkLoginStatus();
    return Scaffold(
      body: Container(
          child: Center(
              child: SizedBox(
                  height: 150.h,
                  width: 250.h,
                  child: Image.asset('assets/images/MainRectangleLogo.png')))),
    );
  }
}
