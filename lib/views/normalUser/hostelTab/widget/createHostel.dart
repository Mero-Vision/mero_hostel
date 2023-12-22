import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/ImageController.dart';
import 'package:mero_hostel/controller/hostel/postHostelController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';

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
  @override
  Widget build(BuildContext context) {
    TextEditingController hostelNameController = TextEditingController();
    var hostelAddressController = TextEditingController();
    var hostelPhoneController = TextEditingController();
    var hostelEmailController = TextEditingController();
    var hostelWebsiteController = TextEditingController();
    var hostelTypeController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
              top: 30.h,
              left: 5.h,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ))),
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        ).marginOnly(top: 30.h);
                      }),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 600,
                    child: Card(
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTextFields(
                                'Hostel Name', hostelNameController),
                            _buildTextFields(
                                'Address', hostelAddressController),
                            _buildTextFields(
                                'Phone number ', hostelPhoneController),
                            _buildTextFields('Email', hostelEmailController),
                            _buildTextFields(
                                'Website', hostelWebsiteController),
                            _buildTextFields(
                                'Hostel Type', hostelTypeController),
                            MyButton(
                                text: 'Create',
                                onTap: () {
                                  controller.createHostel(
                                      hostelNameController.text.trim(),
                                      hostelAddressController.text.trim(),
                                      hostelPhoneController.text.trim(),
                                      hostelEmailController.text.trim(),
                                      hostelWebsiteController.text.trim(),
                                      hostelTypeController.text.trim(),
                                      imageController.imageData.toString());
                                }).marginOnly(top: 10)
                          ],
                        ),
                      ).paddingAll(20.h),
                    ),
                  ).marginOnly(bottom: 20.h, right: 10.h, left: 10.h),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _buildTextFields(String text, TextEditingController textController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyText(text: text, size: 18).marginOnly(bottom: 10.h),
      MyTextFormField(hintText: 'Hostel Name', controller: textController),
    ],
  );
}
