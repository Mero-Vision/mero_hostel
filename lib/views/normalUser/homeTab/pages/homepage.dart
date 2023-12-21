import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/normalUser/homeTab/pages/homePageSkeleton.dart';

import 'package:mero_hostel/views/normalUser/homeTab/widget/heading.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/hostelTile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  LoginController controller = Get.find<LoginController>();

  HostelController hostelcontroller = Get.find<HostelController>();

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = Get.height;
    double ScreenWidth = Get.width;
    User? userData = controller.user?.value?.data.user;

    hostelcontroller.getBoysHostel();
    hostelcontroller.getGirlsHostel();
    Future.delayed(const Duration(seconds: 1), () {
      hostelcontroller.getAllHostel();
    });
    //
    return Scaffold(
        backgroundColor: const Color(0xfff4f5f6),
        body: Obx(
          () => (hostelcontroller.isloading.value == false)
              ? HomePageSkeleton()
              : SafeArea(
                  child: SizedBox(
                    height: ScreenHeight,
                    width: ScreenWidth,
                    child: Column(
                      children: [
                        HomeAppBar(
                          username: userData?.name,
                        ).paddingOnly(
                            right: 10.w, left: 15.h, top: 20.h, bottom: 10.h),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HeadingTitle(
                                  text: 'Recently added',
                                ).paddingOnly(
                                    right: 10.w,
                                    left: 15.h,
                                    top: 5.h,
                                    bottom: 5.h),
                                HomeTile(data: hostelcontroller.hostels),
                                HeadingTitle(
                                  text: 'Boys Hostel',
                                ).paddingOnly(
                                    right: 10.w,
                                    left: 15.h,
                                    top: 5.h,
                                    bottom: 5.h),
                                HomeTile(data: hostelcontroller.boysHostels),
                                HeadingTitle(
                                  text: 'Girls Hostel',
                                ).paddingOnly(
                                    right: 10.w,
                                    left: 15.h,
                                    top: 5.h,
                                    bottom: 5.h),
                                HomeTile(data: hostelcontroller.girlsHostels)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
