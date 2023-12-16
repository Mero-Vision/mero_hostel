import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GridHostelOwnerData extends StatelessWidget {
  const GridHostelOwnerData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: BorderRadius.circular(18.h)),
          child: Center(child: Text('data')),
        ).marginOnly(right: 10.w),
        Container(
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(18.h)),
          child: Center(child: Text('data')),
        ),
      ],
    );
  }
}
