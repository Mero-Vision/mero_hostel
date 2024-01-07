import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/ImageController.dart';
import 'package:mero_hostel/controller/hostel/postHostelController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/controller/userController.dart/userController.dart';
import 'package:mero_hostel/controller/utilController/OptionController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CreateHostelPage extends StatelessWidget {
  CreateHostelPage({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;

  var controller = Get.put<PostHostelController>(PostHostelController());
  var imageController = Get.put<ImageController>(ImageController());
  UserController userController = Get.put(UserController());
  LoginController loginController = Get.find();
  OptionController optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    TextEditingController hostelNameController = TextEditingController();
    var hostelAddressController = TextEditingController();
    var hostelPhoneController = TextEditingController();
    var hostelEmailController = TextEditingController();
    var hostelWebsiteController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight - 50,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    await imageController.getImage();
                  },
                  child: GetBuilder<ImageController>(
                      init: ImageController(),
                      builder: (value) {
                        return SizedBox(
                          height: 200.h,
                          width: 300.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: value.file != null
                                  ? Image.file(value.file!)
                                  : SvgPicture.asset(
                                      'assets/icons/imagePlaceHolder.svg',
                                      fit: BoxFit.fill,
                                    )),
                        ).marginOnly(top: 0.h);
                      }),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 600,
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildTextFields('Hostel Name', 'Hostel name',
                              hostelNameController),
                          _buildTextFields('Address', 'Hostel Address',
                              hostelAddressController),
                          _buildTextFields('Phone number ',
                              'Hostel Phone Number', hostelPhoneController),
                          _buildTextFields('Email', 'Owner/Hostel Email',
                              hostelEmailController),
                          _buildTextFields('Website', 'Hostel Website',
                              hostelWebsiteController),
                          const MyText(text: 'Hostel Type', size: 18)
                              .marginOnly(bottom: 10.h),
                          Obx(
                            () => Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                width: 400.h,
                                child: DropdownButton<String>(
                                  padding:
                                      EdgeInsets.only(left: 10.h, right: 10.h),
                                  value: optionController.hostelOption.value,
                                  underline: Container(),
                                  borderRadius: BorderRadius.circular(15),
                                  onChanged: (String? newValue) {
                                    optionController.hostelOption.value =
                                        newValue!;
                                  },
                                  isExpanded: true,
                                  items: <String>[
                                    'Boys hostel',
                                    'Girls hostel',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                          ),
                          Obx(() => MyButton(
                              width: screenWidth,
                              text: controller.isBooking.value
                                  ? 'Creating....'
                                  : 'Create Hostel',
                              onTap: () {
                                if (!controller.isBooking.value) {
                                  controller
                                      .createHostel(
                                          hostelNameController.text.trim(),
                                          hostelAddressController.text.trim(),
                                          hostelPhoneController.text.trim(),
                                          hostelEmailController.text.trim(),
                                          hostelWebsiteController.text.trim(),
                                          optionController.hostelOption.value,
                                          // hostelTypeController.text.trim(),
                                          imageController.file!)
                                      .then((value) async {
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    String? email =
                                        preferences.getString('userEmail');
                                    String? pass =
                                        preferences.getString('userPassword');
                                    await preferences.setString(
                                        'UserStatus', 'Hostel_Owner');
                                    var token =
                                        preferences.getString('AccessToken');

                                    var response =
                                        await userController.changeUserStatus(
                                            email!, 'Hostel_Owner', token!);
                                    if (response) {
                                      loginController.login(email, pass!);
                                    }
                                  });
                                }
                                print('no action ');
                              }).marginOnly(top: 10))
                        ],
                      ),
                    ).paddingAll(20.h),
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
