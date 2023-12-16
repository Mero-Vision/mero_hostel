// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';

class HeadingTitle extends StatelessWidget {
  HeadingTitle({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: text,
          size: 20.h,
          fontweight: FontWeight.w500,
          color: Colors.black54,
        ),
        GestureDetector(
            onTap: onTap,
            child: MyText(
              text: 'See more',
              color: Colors.blue,
              size: 16.h,
            ))
      ],
    );
  }
}
