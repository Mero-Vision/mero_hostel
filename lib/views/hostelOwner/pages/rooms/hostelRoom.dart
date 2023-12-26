// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/owner/room/RoomController.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/hostelOwner/pages/rooms/createRoomPage.dart';

class HostelRoomPage extends StatelessWidget {
  const HostelRoomPage({
    Key? key,
    required this.hostelId,
  }) : super(key: key);
  final String hostelId;

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.KBackgroundColor,
          bottomOpacity: 1,
          title: MyTextFormField(
              prefix: Icon(Icons.search),
              hintText: 'Search',
              controller: searchController)),
      floatingActionButton: MyButton(
        text: "Create Room's",
        onTap: () {
          Get.to(() => CreateRoomPage(hostelId: hostelId));
        },
        width: 200.h,
        height: 70.h,
      ),
      body: GetBuilder<RoomController>(
          init: RoomController()..getAllRooms(),
          builder: (value) {
            return SizedBox(
              height: AppSize.KScreenHeight,
              width: AppSize.KScreenWidth,
              child: ListView.builder(
                itemCount: value.roomsModel?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var roomData = value.roomsModel?.data?[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Shadow color with opacity
                            spreadRadius: 2.h, // Spread radius
                            blurRadius: 5.h, // Blur radius
                            offset: Offset(0,
                                3.h), // Offset to control the shadow position
                          ),
                        ],
                      ),
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.h),
                            child: MyImageNetwork(
                                imageUrl: roomData?.roomImage == ''
                                    ? 'https://clipart-library.com/img1/1671008.jpg'
                                    : roomData!.roomImage!,
                                boxFit: BoxFit.cover,
                                height: 100.h,
                                width: 100.h),
                          ),
                          Container(
                            height: 100.h,
                            width: 270.w,
                            //  color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    text: 'No. ${roomData!.roomNumber}',
                                    size: 20.h),
                                MyText(
                                    text:
                                        'Available ? : ${roomData.availability}',
                                    size: 16.h),
                                MyText(
                                    text: 'Capacity : ${roomData.capacity}',
                                    size: 16.h),
                                MyText(
                                    text: 'Price : ${roomData.price}',
                                    size: 16.h)
                              ],
                            ),
                          ).marginOnly(left: 10.h)
                        ],
                      ).marginAll(10.h),
                    ),
                  ).marginOnly(top: 10.h, left: 10.h, right: 10.h);
                },
              ),
            );
          }),
    );
  }
}
