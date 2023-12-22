// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/utils/constant.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({
    Key? key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);
  final String profileImage;
  final String userName;
  final String userEmail;
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
                iconButtons(Icons.edit_sharp, 'Edit Profile', () {}),
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
                      child: Image.network(
                        'https://i.pinimg.com/564x/f7/9a/62/f79a625ca3bd114f6e0560df9c3626e6.jpg',
                        height: 140.h,
                        width: 140.h,
                        fit: BoxFit.cover,
                      )).paddingAll(10.h),
                ),
              ),
              MyText(
                top: 10.h,
                text: userName,
                size: 22.h,
                fontWeight: FontWeight.w700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email),
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
