// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              color: Colors.white, borderRadius: BorderRadius.circular(18.h)),
          child: const Center(child: Text('data')),
        ),
      ],
    );
  }
}
