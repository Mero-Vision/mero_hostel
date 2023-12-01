import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/home/homePageSkeleton.dart';

import 'package:mero_hostel/views/home/widget/heading.dart';
import 'package:mero_hostel/views/home/widget/home_appbar.dart';
import 'package:mero_hostel/views/home/widget/hostelTile.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Center(
        child: Text('Search Screen Content'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = Get.height;
    double ScreenWidth = Get.width;
    LoginController controller = Get.put(LoginController());
    User? userData = controller.user?.value?.data.user;
    return Scaffold(
      backgroundColor: const Color(0xfff4f5f6),
      body: (userData?.name != null)
          ? HomePageSkeleton()
          : SafeArea(
              child: SizedBox(
                height: ScreenHeight,
                width: ScreenWidth,
                child: Column(
                  children: [
                    HomeAppBar(
                      username: userData?.name,
                    ).paddingOnly(top: 20.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HeadingTitle(
                              text: 'Recently added',
                            ).paddingAll(15.sp).marginOnly(top: 20.h),
                            HomeTile(),
                            HeadingTitle(
                              text: 'Boys Hostel',
                            ).paddingAll(15.sp),
                            HomeTile(),
                            HeadingTitle(
                              text: 'Girls Hostel',
                            ).paddingAll(15.sp),
                            HomeTile()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
