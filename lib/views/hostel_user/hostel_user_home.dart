import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel_user/hostel_user_controller.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/hostelPage.dart';

class HostelUserHomePage extends StatelessWidget {
  HostelUserHomePage({super.key, required this.userDataModel});
  final UserDataModel userDataModel;
  final HostelUserController hostelUserController =
      Get.put(HostelUserController());

  @override
  Widget build(BuildContext context) {
    hostelUserController.getHostelUserData(userId: userDataModel.data?.id ?? 0);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: HomeAppBar(
            userImageURL: userDataModel.data?.profileImage,
            username: userDataModel.data?.name,
            userData:
                userDataModel.data), //----------------------------------------
      ),
      bottomNavigationBar: MyButton(
          height: 60.h,
          left: 20.h,
          right: 20.h,
          text: 'logout',
          onTap: () {
            loginController.logout();
          }),
      body: SingleChildScrollView(
        child: GetBuilder<HostelUserController>(builder: (value) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: value.hostelUserDataModel.data?[0].hostelName ?? '',
                    size: 30.h,
                    fontWeight: FontWeight.w700,
                    color: AppColor.KsubBlackColor,
                  ).marginSymmetric(vertical: 10.h),
                  MyText(
                    text:
                        'Address : ${value.hostelUserDataModel.data?[0].address ?? ''}',
                    size: 20.h,
                    fontWeight: FontWeight.w700,
                    color: AppColor.KsubBlackColor,
                  ).marginOnly(bottom: 10.h),
                  MyText(
                    text:
                        'Number : ${value.hostelUserDataModel.data?[0].phoneNumber ?? ''}',
                    size: 18.h,
                    fontWeight: FontWeight.w700,
                    color: AppColor.KsubBlackColor,
                  ).marginOnly(bottom: 10.h),
                ],
              )
              //------------------
              ,
              Column(
                children: [
                  _midSection(
                      flex1: 5,
                      flex2: 3,
                      title1: 'Expenses',
                      title2:
                          'Room ${value.hostelUserDataModel.data?[0].roomNumber ?? ''}',
                      color1: AppColor.KGreenColor,
                      color2: AppColor.KsubBlackColor,
                      onTap1: () {},
                      onTap2: () {}),
                  _midSection(
                      flex1: 2,
                      flex2: 3,
                      title1: 'All Hostel',
                      title2: 'Room Mates',
                      color1: AppColor.KButtonSubColor,
                      color2: AppColor.KsubBlackColor,
                      onTap1: () {
                        Get.to(() => HostelPage(
                              userStatus: 'Hostel_User',
                            ));
                      },
                      onTap2: () {})
                ],
              ),

              //     Expanded(flex: 2, child: Container()),
              //----------------------------------------------------

              //--------------------------------------------------------------

              // Expanded(flex: 1, child: Container()),
            ],
          ).marginSymmetric(horizontal: 15.h, vertical: 15.h);
        }),
      ),
    );
  }

  Widget _midSection({
    required int flex1,
    required int flex2,
    required String title1,
    required String title2,
    required Color color1,
    required Color color2,
    required VoidCallback onTap1,
    required VoidCallback onTap2,
  }) {
    return Row(
      children: [
        Expanded(
          flex: flex1,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                // color: Colors.black38,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(16.h)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.h),
              onTap: onTap1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: title1,
                    size: 26.h,
                    fontWeight: FontWeight.bold,
                    color: color1,
                  )
                ],
              ),
            ),
          ).marginOnly(bottom: 10.h, right: 10.h),
        ),
        Expanded(
          flex: flex2,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(16.h)),
            child: InkWell(
              onTap: onTap2,
              borderRadius: BorderRadius.circular(16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: title2,
                    size: 20.h,
                    fontWeight: FontWeight.bold,
                    color: color2,
                  )
                ],
              ),
            ),
          ).marginOnly(bottom: 10.h),
        )
      ],
    );
  }
}
