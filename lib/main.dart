import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/views/home/widget/bottomNavBar.dart';
import 'package:mero_hostel/views/login/loginPage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 957),
      builder: (_, child) {
        return GetMaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: const Color(0xfff4f5f6)),
            home: BottomNavBar(),
            debugShowCheckedModeBanner: false);
      },
    );
  }
}
