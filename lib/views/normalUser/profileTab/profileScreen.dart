// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/controller/loginRegister/loginController.dart';

import 'package:mero_hostel/models/user/user_model.dart';

import 'package:mero_hostel/views/normalUser/profileTab/widgets/topsection.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final Data? userData;
  LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            userData?.status == 'Hostel_Owner'
                ? Container()
                : IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    icon: Icon(
                      Icons.login_outlined,
                      size: 35.h,
                    ).marginOnly(right: 10.h))
          ],
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100.h,
            child: Column(
              children: [
                ProfileTopSection(
                  userId: userData?.id.toString(),
                  profileImage: userData?.profileImage
                     ,
                  userName: userData?.name ?? 'No name',
                  userEmail: userData?.email ?? 'email not found',
                ),
                Card(
                  child: ListTile(
                    title: const Text('Notification'),
                    leading: Icon(
                      Icons.notifications_active_rounded,
                      color: Colors.green.shade700,
                    ),
                    onTap: () {},
                  ).marginAll(10.h),
                ).marginAll(10.h),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.theater_comedy,
                      color: Colors.orange.shade700,
                    ),
                    title: const Text(
                      'Theme',
                    ),
                    onTap: () {},
                  ),
                ).marginAll(10.h),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About us'),
                    onTap: () {},
                  ),
                ).marginAll(10.h)
              ],
            ),
          ),
        ));
  }
}
