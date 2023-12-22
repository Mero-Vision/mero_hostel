// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mero_hostel/utils/constant.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
    this.color,
    required this.size,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.onTap,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  }) : super(key: key);
  //initializing variables
  final String text;
  final Color? color;
  final double size;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final void Function()? onTap;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
            top: top ?? 0,
            bottom: bottom ?? 0,
            left: left ?? 0,
            right: right ?? 0),
        child: Text(
          text,
          maxLines: 5,
          style: TextStyle(
              color: color ?? AppColor.KTextColor,
              fontSize: size.h,
              fontStyle: fontStyle,
              decoration: textDecoration,
              decorationColor: Colors.blue,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
