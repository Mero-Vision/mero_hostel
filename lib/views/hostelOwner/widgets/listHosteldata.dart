import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListHostelData extends StatelessWidget {
  const ListHostelData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Card(
        color: Colors.green.shade400,
        child: const Center(child: Text('data')),
      ),
    ).paddingOnly(left: 10.w, right: 10.w);
  }
}
