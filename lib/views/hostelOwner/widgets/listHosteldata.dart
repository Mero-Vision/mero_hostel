import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListHostelData extends StatelessWidget {
  const ListHostelData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      child: Card(
        color: Colors.green.shade400,
        child: Center(child: Text('data')),
      ),
    ).paddingOnly(left: 10.w, right: 10.w);
  }
}
