// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/ImageController.dart';
import 'package:mero_hostel/controller/userController.dart/userController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/utils/constant.dart';

// ignore: must_be_immutable
class EditProfilePage extends StatelessWidget {
  EditProfilePage({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    this.userImage,
    required this.userId,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;
  final String? userImage;
  final String userId;
  var imageController = Get.put<ImageController>(ImageController());
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.getUserInfo(accessToken: null, userId: userId);
    TextEditingController nameController = TextEditingController();
    var emailController = TextEditingController();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 205, 205, 205),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 205, 205, 205),
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    await imageController.getImage(x: 2, y: 2);
                  },
                  child: GetBuilder<ImageController>(
                      init: ImageController(),
                      builder: (value) {
                        return SizedBox(
                            height: 200.h,
                            width: 200.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: value.file != null
                                  ? Image.file(value.file!)
                                  : (userImage != null && userImage != ''
                                      ? MyImageNetwork(
                                          imageUrl: userImage!,
                                          boxFit: BoxFit.cover,
                                          height: 100.h,
                                          width: 100.h)
                                      : MyImageNetwork(
                                          imageUrl: AppConstants.userImageDummy,
                                          boxFit: BoxFit.cover,
                                          height: 140.h,
                                          width: 140.h)),
                            )).marginOnly(top: 30.h);
                      }),
                ).marginAll(30.h),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 400.h,
                    child: Card(
                      child: Form(
                        child: GetBuilder<UserController>(builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildTextFields(
                                'Full Name',
                                userController.userData?.data?.name ?? '',
                                nameController,
                              ).marginOnly(bottom: 20.h),
                              _buildTextFields(
                                      'Email',
                                      userController.userData?.data?.email ??
                                          '',
                                      emailController)
                                  .marginOnly(bottom: 50.h),
                              GetBuilder<UserController>(builder: (value) {
                                return MyButton(
                                    text: value.isLoaded
                                        ? 'Loading...'
                                        : 'Conform edit',
                                    onTap: () {
                                      // value.isLoaded = true;
                                      if (!value.isLoaded) {
                                        userController.editUserProfile(
                                            userId: userId,
                                            newName: (nameController.text
                                                        .trim() ==
                                                    '')
                                                ? userController
                                                    .userData!.data!.name!
                                                : nameController.text
                                                    .toString(),
                                            newEmail:
                                                emailController.text.trim() ==
                                                        ''
                                                    ? userController
                                                        .userData!.data!.email!
                                                        .toLowerCase()
                                                    : emailController.text
                                                        .trim()
                                                        .toString()
                                                        .toLowerCase(),
                                            newProfile: imageController.file);
                                      }
                                      print('Noaction');
                                    }).marginOnly(top: 10);
                              })
                            ],
                          );
                        }),
                      ).paddingAll(20.h),
                    ),
                  ).marginOnly(bottom: 20.h, right: 10.h, left: 10.h),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _buildTextFields(
    String text, String hintText, TextEditingController textController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyText(text: text, size: 18).marginOnly(bottom: 10.h),
      MyTextFormField(hintText: hintText, controller: textController),
    ],
  );
}
