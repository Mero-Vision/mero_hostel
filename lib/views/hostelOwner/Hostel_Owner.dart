// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/hostelOwner/widgets/GridHostelOwnerData.dart';
import 'package:mero_hostel/views/hostelOwner/widgets/listHosteldata.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';

class HostelOwner extends StatelessWidget {
  const HostelOwner({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final User userData;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    LoginController controller = Get.find();

    return Scaffold(
      drawer: SafeArea(
          child: Drawer(
              shape: const Border(),
              backgroundColor: AppColor.KBackgroundColor,
              child: SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          controller.logout();
                        },
                        tileColor: Colors.white,
                        title: const Text('LogOut'),
                      ),
                    ],
                  )))),
      appBar: AppBar(
        title: HomeAppBar(
          username: userData.name,
          userImageURL: null,
          userData: userData,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: screenHeight - 60.h,
            width: screenWidth,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const GridHostelOwnerData().marginOnly(
                      right: 10.w,
                    ),
                    const GridHostelOwnerData()
                  ],
                ).marginOnly(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
                Row(
                  children: [
                    const GridHostelOwnerData().marginOnly(
                      right: 10.w,
                    ),
                    const GridHostelOwnerData()
                  ],
                ).marginOnly(left: 10.w, bottom: 10.h),
                const ListHostelData(),
                const ListHostelData(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
