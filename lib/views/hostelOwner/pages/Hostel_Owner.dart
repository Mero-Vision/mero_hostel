// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/controller/owner/ownerController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';

import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/hostelOwner/pages/bookingReqPage.dart';
import 'package:mero_hostel/views/hostelOwner/pages/rooms/hostelRoom.dart';
import 'package:mero_hostel/views/hostelOwner/widgets/listHosteldata.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/hostelPage.dart';

// ignore: must_be_immutable
class HostelOwner extends StatelessWidget {
  HostelOwner({
    Key? key,
    required this.userDataModel,
  }) : super(key: key);
  final UserDataModel userDataModel;
  LoginController controller = Get.find();
  OwnerController ownerController = Get.put(OwnerController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = AppSize.KScreenHeight.h;
    double screenWidth = AppSize.KScreenWidth.w;
    var userData = userDataModel.data;
    ownerController.getOwnerHostel(userData!.id!);

    return Scaffold(
      drawer: GetBuilder<OwnerController>(builder: (context) {
        return SafeArea(
            child: _OwnerDrawer(ownerController.hostelData?.data?[0]));
      }),
      appBar: AppBar(
        title: HomeAppBar(
          username: 'Welcome ${userData.name}',
          userImageURL: userData.profileImage,
          userData: userData,
        ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                        height: 200.h,
                        width: 200.w,
                        text: 'Coming Soon..',
                        onTap: () {},
                      ).marginOnly(
                        right: 10.w,
                      ),
                      Container(
                          height: 200.h,
                          width: 200.w,
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
                                      },
                                      iconSize: 50.h,
                                      icon: const Icon(Icons.search)),
                                  IconButton(
                                    onPressed: () async {
                                      //
                                      Get.to(() => BookingReqPage(
                                            ownerController: value,
                                            userId: userData.id!,
                                          ));
                                    },
                                    iconSize: 50.h,
                                    icon: const Icon(Icons.account_box),
                                    color:
                                        const Color.fromARGB(255, 21, 168, 236),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      color: AppColor.KButtonSubColor,
                                      onPressed: () async {},
                                      iconSize: 50.h,
                                      icon: const Icon(Icons.notifications)),
                                  IconButton(
                                      onPressed: () async {},
                                      iconSize: 50.h,
                                      icon: const Icon(
                                          CupertinoIcons.settings_solid)),
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
                        width: 200.w,
                        text: 'Coming Soon..',
                        onTap: () {},
                      ).marginOnly(
                        right: 10.w,
                      ),
                      _roomTab()
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

  Widget _OwnerDrawer(hostelData) {
    return Drawer(
        shape: const Border(),
        backgroundColor: AppColor.KBackgroundColor,
        child: SizedBox(
            width: 200.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  width: AppSize.KScreenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.h),
                        child: MyImageNetwork(
                            imageUrl: hostelData?.hostelImages ??
                                'https://i.pinimg.com/564x/04/dd/5b/04dd5bf46aeb55c60918da9efd2bd3d7.jpg',
                            boxFit: BoxFit.cover,
                            height: 140.h,
                            width: 140.h),
                      ),
                      MyText(
                        text: hostelData?.hostelName ?? 'NoName',
                        size: 20.h,
                        fontWeight: FontWeight.w500,
                      ),
                      MyText(
                        text: hostelData?.email ?? 'NoEmail',
                        size: 16.h,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ).paddingOnly(
                      right: 10.h, left: 10.h, top: 20.h, bottom: 20.h),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => HostelPage());
                  },
                  tileColor: Colors.white,
                  title: const Text('All Hostels'),
                ).paddingOnly(top: 10.h),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  tileColor: Colors.white,
                  title: const Text('LogOut'),
                ).paddingOnly(top: 10.h),
              ],
            )));
  }

  Widget _roomTab() {
    return Material(
      borderRadius: BorderRadius.circular(15.h),
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: const CachedNetworkImageProvider(
          'https://i.pinimg.com/564x/04/dd/5b/04dd5bf46aeb55c60918da9efd2bd3d7.jpg',
        ),
        colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
        fit: BoxFit.cover,
        width: 200.w,
        height: 200.h,
        child: InkWell(
          onTap: () {
            Get.to(() => HostelRoomPage(
                  hostelId:
                      ownerController.hostelData?.data?[0].id.toString() ?? '',
                ));
          },
          borderRadius: BorderRadius.circular(15.h),
          child: Container(
            width: 200.w,
            height: 200.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                Text(
                  "  Room's",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
