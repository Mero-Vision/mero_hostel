// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppColor {
  static Color KTextColor = Colors.black;
  static Color KButtonColor = const Color(0xff6173F3);
  static Color KButtonSubColor = const Color(0xffEE6E33);

  static Color KBackgroundColor = Color.fromARGB(255, 230, 232, 234);
  static Color KGreenColor = const Color(0xff0E6A28);
  static Color KAppBarSubTitleColor = const Color(0xffA84343);
}

abstract class AppSize {
  static double KScreenWidth = 430;
  static double KScreenHeight = 957;
}
