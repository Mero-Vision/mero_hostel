import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/home/widget/heading.dart';
import 'package:mero_hostel/views/home/widget/home_appbar.dart';
import 'package:mero_hostel/views/home/widget/hostelTile.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
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
    //  User userData = controller.user.value!.data.user;
    return Scaffold(
      backgroundColor: Color(0xfff4f5f6),
      body: SafeArea(
        child: Container(
          height: ScreenHeight,
          width: ScreenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar().paddingOnly(top: 20.h, bottom: 40.h),
              HeadingTitle(
                text: 'Boys Hostel',
              ).paddingAll(15.sp),
              HostelTile(),
              HeadingTitle(
                text: 'Girls Hostel',
              ).paddingAll(15.sp),
              HostelTile()
            ],
          ),
        ),
      ),
    );
  }
}
