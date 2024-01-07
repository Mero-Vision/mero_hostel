// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/controller/hostel/ImageController.dart';
import 'package:mero_hostel/controller/owner/room/RoomController.dart';
import 'package:mero_hostel/controller/utilController/OptionController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/utils/constant.dart';

// ignore: must_be_immutable
class CreateRoomPage extends StatelessWidget {
  CreateRoomPage({
    Key? key,
    required this.hostelId,
  }) : super(key: key);
  final String hostelId;
  var roomController = Get.put<RoomController>(RoomController());
  var imageController = Get.put<ImageController>(ImageController());
  OptionController optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = AppSize.KScreenHeight.h;
    double screenWidth = AppSize.KScreenWidth.w;
    var roomNumberController = TextEditingController();
//    var roomTypeController = TextEditingController();
    var capacityController = TextEditingController();
    var availabilityController = TextEditingController();
    var priceController = TextEditingController();
    var featuresController = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight - 20,
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
                          height: 180.h,
                          width: 300.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: value.file != null
                                  ? Image.file(value.file!)
                                  : SvgPicture.asset(
                                      'assets/icons/imagePlaceHolder.svg',
                                      fit: BoxFit.cover,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTextFields('Room number', 'Add room number',
                                roomNumberController),
                            _buildTextFields('Room capacity ', 'Room capacity',
                                capacityController),
                            _buildTextFields('Is room available ?', 'Yes/No',
                                availabilityController),
                            _buildTextFields('Room price', 'Price in number',
                                priceController),
                            _buildTextFields(
                                'Room features',
                                'Washing machine,Heater,etc.....',
                                featuresController),
                            const MyText(text: 'Room Type', size: 18)
                                .marginOnly(bottom: 10.h),
                            Obx(
                              () => Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 400.h,
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.only(
                                        left: 10.h, right: 10.h),
                                    value: optionController.roomOptions.value,
                                    underline: Container(),
                                    borderRadius: BorderRadius.circular(15),
                                    onChanged: (String? newValue) {
                                      optionController.roomOptions.value =
                                          newValue!;
                                    },
                                    isExpanded: true,
                                    items: <String>[
                                      'Single Bed',
                                      'Double Bed',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )),
                            ),
                            GetBuilder<RoomController>(builder: (value) {
                              return MyButton(
                                  width: screenWidth,
                                  text: value.isLoading
                                      ? 'Loading....'
                                      : 'Create',
                                  onTap: () {
                                    if (!value.isLoading) {
                                      value.createSingleRoom(
                                          roomNumberController.text.trim(),
                                          optionController.roomOptions.value,
                                          capacityController.text.trim(),
                                          availabilityController.text.trim(),
                                          priceController.text.trim(),
                                          featuresController.text.trim(),
                                          hostelId,
                                          imageController.file);
                                    }
                                  }).marginOnly(top: 10);
                            })
                          ],
                        ),
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
