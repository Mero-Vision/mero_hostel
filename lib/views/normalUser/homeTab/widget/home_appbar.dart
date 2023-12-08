// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    this.username,
  }) : super(key: key);
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: username ?? 'Hi, User',
                size: 16.h,
                color: Colors.black,
                fontweight: FontWeight.w600,
              ),
              MyText(
                text: 'Find best Hostel nearby.',
                size: 22.h,
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

            child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.network(
                  'https://i.pinimg.com/564x/f7/9a/62/f79a625ca3bd114f6e0560df9c3626e6.jpg',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ).marginSymmetric(vertical: 10.h),
    );
  }
}
