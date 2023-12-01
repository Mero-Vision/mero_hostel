// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';

import 'package:mero_hostel/utils/constant.dart';

var logincontroller = Get.find<LoginController>();

class MyButton extends GetView<LoginController> {
  MyButton({
    Key? key,
    required this.text,
    required this.ontap,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.fontsize,
    this.fontWeight,
    this.top,
    this.left,
    this.right,
    this.bottom,
  }) : super(key: key);
  final String text;
  final void Function() ontap;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0,
          right: right ?? 0,
          left: left ?? 0,
          bottom: bottom ?? 0),
      child: ElevatedButton(
          onPressed: ontap,
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 14.r))),
              fixedSize: MaterialStatePropertyAll(
                  Size(width ?? 350.w, height ?? 55.h)),
              backgroundColor: MaterialStatePropertyAll(color ?? KButtonColor)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontsize ?? 20.sp,
                color: Colors.white,
                fontWeight: fontWeight ?? FontWeight.w600),
          )),
    );
  }
}
