import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/MyControllerBinding.dart';
import 'package:mero_hostel/SplashScreen.dart';
import 'package:mero_hostel/utils/constant.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: false,
      splitScreenMode: true,
      designSize: const Size(430, 957),
      builder: (_, child) {
        return GetMaterialApp(
            initialBinding: MyControllerBinding(),
            scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.unknown,
              PointerDeviceKind.stylus,
              PointerDeviceKind.touch
            }),
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.KBackgroundColor,
            ),
            home: SplashScreen(),
            debugShowCheckedModeBanner: false);
      },
    );
  }
}
