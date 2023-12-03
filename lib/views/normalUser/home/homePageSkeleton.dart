import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/skeleton.dart';
import 'package:mero_hostel/views/normalUser/home/widget/heading.dart';
import 'package:mero_hostel/views/normalUser/home/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/home/widget/hostelTile.dart';
import 'package:shimmer/shimmer.dart';

class HomePageSkeleton extends StatelessWidget {
  const HomePageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = Get.height;
    double ScreenWidth = Get.width;

    return SafeArea(
      child: SizedBox(
        height: ScreenHeight,
        width: ScreenWidth,
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
                    HeadingTitle(
                      text: 'Recently added',
                    ).paddingAll(15.h).marginOnly(top: 20.h),
                    const Skeleton(
                      widget: HomeTile(),
                    ),
                    HeadingTitle(
                      text: 'Boys Hostel',
                    ).paddingAll(15.sp),
                    const Skeleton(
                      widget: HomeTile(),
                    ),
                    HeadingTitle(
                      text: 'Girls Hostel',
                    ).paddingAll(15.sp),
                    const Skeleton(
                      widget: HomeTile(),
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
