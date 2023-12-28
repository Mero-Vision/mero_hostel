// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/controller/utilController/bottomNavBarController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/normalUser/profileTab/profileScreen.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    Key? key,
    this.username,
    this.userImageURL,
    this.userData,
  }) : super(key: key);
  final String? username;
  final String? userImageURL;
  final Data? userData;
  final BottomNavBarController _barController = Get.find();

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
                fontWeight: FontWeight.w600,
              ),
              MyText(
                text: 'Find best Hostel nearby.',
                size: 22.h,
                color: AppColor.KAppBarSubTitleColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _barController.selectedIndex.value = 3;
              if (userData != null && userData?.status == 'Hostel_Owner') {
                Get.to(() => ProfileScreen(userData: userData));
              }
            },
            child: Container(
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
                    userImageURL ??
                        'https://i.pinimg.com/564x/f7/9a/62/f79a625ca3bd114f6e0560df9c3626e6.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ],
      ).marginSymmetric(vertical: 10.h),
    );
  }
}
