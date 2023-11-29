import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Hi, User',
              size: 16,
              color: Colors.black,
              fontweight: FontWeight.w600,
            ),
            MyText(
              text: 'Find best hostel nearby.',
              size: 22.sp,
              color: Color(0xffA84343),
              fontweight: FontWeight.w600,
            ),
          ],
        ),
        Container(
          // margin: EdgeInsets.only(right: 16.0),
          height: 54.h,
          width: 54.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ],
    ).marginSymmetric(horizontal: 16.w, vertical: 10.h);
  }
}
