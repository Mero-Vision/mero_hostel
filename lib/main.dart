import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/views/login/loginPage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
