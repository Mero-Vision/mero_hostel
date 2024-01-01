// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/normalUser/profileTab/editProfilePage.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({
    Key? key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
    required this.emailVerification,
    this.userId,
  }) : super(key: key);
  final String? profileImage;
  final String userName;
  final String userEmail;
  final bool emailVerification;
  final String? userId;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 470.h - 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.h),
              color: AppColor.KButtonColor),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconButtons(CupertinoIcons.heart_circle, 'Favorite', () {}),
                iconButtons(Icons.edit_sharp, 'Edit Profile', () {
                  Get.to(() => EditProfilePage(
                      userImage: profileImage,
                      userId: userId!,
                      screenHeight: MediaQuery.of(context).size.height,
                      screenWidth: MediaQuery.of(context).size.width));
                }),
                iconButtons(CupertinoIcons.settings, 'Setting', () {}),
              ],
            ),
          ),
        ),
        Container(
          height: 375.h - 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.h),
                  bottomRight: Radius.circular(20.h)),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const Alignment(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: Colors.grey),
                  height: 140.h,
                  width: 140.h,
                  child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: profileImage != null && profileImage != ''
                              ? MyImageNetwork(
                                  imageUrl: profileImage!,
                                  boxFit: BoxFit.contain,
                                  height: 140.h,
                                  width: 140.h)
                              : MyImageNetwork(
                                  imageUrl:
                                      'https://i.pinimg.com/564x/f7/9a/62/f79a625ca3bd114f6e0560df9c3626e6.jpg',
                                  boxFit: BoxFit.cover,
                                  height: 140.h,
                                  width: 140.h))
                      .paddingAll(10.h),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: emailVerification ? 'Verified' : 'Unverified',
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: emailVerification ? Colors.green : Colors.redAccent,
                  ),
                  emailVerification
                      ? Icon(
                          Icons.verified,
                          color: Colors.green,
                        )
                      : Icon(
                          CupertinoIcons.multiply_circle_fill,
                          color: Colors.redAccent,
                        )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 20, 20, 20),
                  ),
                  MyText(
                    top: 10.h,
                    text: userName,
                    size: 22.h,
                    color: Color.fromARGB(255, 35, 35, 35),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey.shade700,
                  ),
                  MyText(
                    left: 5.h,
                    text: userEmail,
                    size: 18.h,
                    color: Colors.grey.shade700,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget iconButtons(IconData icon, text, VoidCallback onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        iconSize: 35.h,
      ),
      MyText(
        text: text,
        size: 16,
        color: Colors.white,
        bottom: 10.h,
      )
    ],
  );
}
