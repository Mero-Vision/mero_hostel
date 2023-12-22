// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/skeleton.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/heading.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/hostelTileSkeleton.dart';
import 'package:shimmer/shimmer.dart';

class HomePageSkeleton extends StatelessWidget {
  const HomePageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;

    return SafeArea(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade300,
                child: HomeAppBar().paddingOnly(top: 20.h)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const HeadingTitle(
                      text: 'Recently added',
                    ).paddingAll(15.h).marginOnly(top: 20.h),
                    const Skeleton(
                      widget: HomeTileSkeleton(),
                    ),
                    const HeadingTitle(
                      text: 'Boys Hostel',
                    ).paddingAll(15.sp),
                    const Skeleton(
                      widget: HomeTileSkeleton(),
                    ),
                    const HeadingTitle(
                      text: 'Girls Hostel',
                    ).paddingAll(15.sp),
                    const Skeleton(
                      widget: HomeTileSkeleton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
