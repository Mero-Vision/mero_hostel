// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/normalUser/homeTab/pages/viewHostel.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/widget/createHostel.dart';

// ignore: must_be_immutable
class HostelPage extends StatelessWidget {
  HostelPage({super.key});
  // var controller = Get.find<HostelController>();
  final LoginController _loginController = Get.find();
  HostelController hostelController = Get.put(HostelController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // if (_loginController.user?.value?.data.user.status == 'Hostel_Owner') {
    hostelController.getAllHostel();
    hostelController.getBoysHostel();
    hostelController.getGirlsHostel();
    //}

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Hostels'),
            backgroundColor: AppColor.KBackgroundColor,
            bottom: TabBar(tabs: [
              Text('ALL').paddingAll(15),
              Text('BOYS').paddingAll(15),
              Text('GIRLS').paddingAll(15)
            ]),
          ),
          floatingActionButton: Obx(
            () => SizedBox(
                height: 60.h,
                width: 200.h,
                child: _loginController.userStatus.value != 'Hostel_Owner'
                    ? _loginController.isLoggedIn.value
                        ? FloatingActionButton(
                            backgroundColor: AppColor.KButtonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: MyText(
                              color: Colors.white,
                              text: 'Create Hostel',
                              size: 20.h,
                            ),
                            onPressed: () {
                              Get.to(() => CreateHostelPage(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth));
                            },
                          )
                        : const SizedBox()
                    : const SizedBox()),
          ),
          body: Obx(
            () => TabBarView(children: [
              dynamicHostel(hostelController.hostels),
              dynamicHostel(hostelController.boysHostels),
              dynamicHostel(hostelController.girlsHostels)
            ]),
          )),
    );
  }

  Widget dynamicHostel(hostelData) {
    return ListView.builder(
      itemCount: hostelData.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ViewHostel(
                        hostelData: hostelController.isEmpty.value
                            ? hostelController.hostels[index]
                            : hostelData[index])));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.h),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            height: 130.h,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.h),
                  child: MyImageNetwork(
                    imageUrl: hostelData[index].hostelImages ??
                        'https://i.pinimg.com/236x/06/fd/9d/06fd9dde192fe02644663c4bda0cf6ca.jpg',
                    boxFit: BoxFit.cover,
                    height: 130.h,
                    width: 130.h,
                  ),
                ).paddingAll(7.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: hostelData[index].hostelName ?? 'Not Available',
                      size: 20.h,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                    MyText(
                      text: hostelData[index].email ?? 'Not Available',
                      size: 16.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                    MyText(
                      text: hostelData[index].address ?? 'Not Available',
                      size: 16.h,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    )
                  ],
                ).marginAll(10.h)
              ],
            ),
          ).paddingOnly(top: 20, left: 20, right: 20),
        );
      },
    );
  }
}
