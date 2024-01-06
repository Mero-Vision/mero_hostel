// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppColor {
  static Color KTextColor = Colors.black;
  static Color KButtonColor = const Color(0xff6173F3);
  static Color KButtonSubColor = const Color(0xffEE6E33);

  static Color KBackgroundColor = Color.fromARGB(255, 230, 232, 234);
  static Color KGreenColor = const Color(0xff0E6A28);
  static Color KAppBarSubTitleColor = const Color(0xffA84343);
  static Color KsubBlackColor = Color.fromARGB(221, 43, 43, 43);
}

abstract class AppSize {
  static double KScreenWidth = 430;
  static double KScreenHeight = 957;
}

abstract class AppConstants {
  static String userImageDummy =
      'https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg';
  static String dummyHostelData =
      'https://firebasestorage.googleapis.com/v0/b/ratemydorm-7bc3c.appspot.com/o/user-photos%2FqGTODwmIUnVklo9liqLRdRjQxsz1%2FqGTODwmIUnVklo9liqLRdRjQxsz1-IMG_2225.j-1679509525521?alt=media&token=f39d0524-8868-48cc-a222-35873400985a';
}
