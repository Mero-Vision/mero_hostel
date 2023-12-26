// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/controller/owner/ownerController.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/hostelOwner/pages/bookingReqPage.dart';

import 'package:mero_hostel/views/hostelOwner/widgets/listHosteldata.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/hostelPage.dart';

// ignore: must_be_immutable
class HostelOwner extends StatelessWidget {
  HostelOwner({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final User userData;
  LoginController controller = Get.find();
  OwnerController ownerController = Get.put(OwnerController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ownerController.getOwnerHostel(userData.id);

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
                          Get.to(() => HostelPage());
                        },
                        tileColor: Colors.white,
                        title: const Text('All Hostels'),
                      ),
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
        title: GetBuilder<OwnerController>(
            //  init: ownerController,
            builder: (value) {
          return HomeAppBar(
            username: value.hostelData?.data?[0].hostelName,
            userImageURL: null,
            userData: userData,
          );
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<OwnerController>(
              //       init: ownerController,
              builder: (value) {
            return SizedBox(
              height: screenHeight - 60.h,
              width: screenWidth,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        height: 200.h,
                        width: 200.h,
                        text: 'data',
                        onTap: () {},
                      ).marginOnly(
                        right: 10.w,
                      ),
                      Container(
                          height: 200.h,
                          width: 200.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.h)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        //
                                        Get.to(() => BookingReqPage(
                                              ownerController: value,
                                              userId: userData.id,
                                            ));
                                      },
                                      iconSize: 50.h,
                                      icon: Icon(Icons.home)),
                                  IconButton(
                                      onPressed: () async {
                                        //
                                        Get.to(() => BookingReqPage(
                                              ownerController: value,
                                              userId: userData.id,
                                            ));
                                      },
                                      iconSize: 50.h,
                                      icon: Icon(Icons.account_box)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      color: AppColor.KButtonSubColor,
                                      onPressed: () async {
                                        //
                                        Get.to(() => BookingReqPage(
                                              ownerController: value,
                                              userId: userData.id,
                                            ));
                                      },
                                      iconSize: 50.h,
                                      icon: Icon(Icons.notifications)),
                                  IconButton(
                                      onPressed: () async {
                                        //
                                        Get.to(() => BookingReqPage(
                                              ownerController: value,
                                              userId: userData.id,
                                            ));
                                      },
                                      iconSize: 50.h,
                                      icon: Icon(Icons.search)),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ).marginOnly(
                      top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
                  Row(
                    children: [
                      MyButton(
                        height: 200.h,
                        width: 200.h,
                        text: 'data',
                        onTap: () {},
                      ).marginOnly(
                        right: 10.w,
                      ),
                      MyButton(
                        height: 200.h,
                        width: 200.h,
                        text: 'data',
                        onTap: () {},
                      )
                    ],
                  ).marginOnly(left: 10.w, bottom: 10.h),
                  const ListHostelData(),
                  const ListHostelData(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
