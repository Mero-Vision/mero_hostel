// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/controller/owner/room/RoomController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';

class UserAssignRoom extends StatelessWidget {
  UserAssignRoom({
    Key? key,
    required this.userId,
    required this.hostelId,
  }) : super(key: key);
  final int userId;
  final int hostelId;
  final RoomController _roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    _roomController.getRoomToAssign(hostelId);
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => _roomController.isLoaded.value
            ? ListView.builder(
                itemCount: _roomController.getAssignRoomModel!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  // return Text(_roomController
                  //     .getAssignRoomModel!.data![index].roomNumber!);
      
                  return
                      //
      
                      Container(
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
                              imageUrl:
                                  //roomData?.roomImage == ''
      
                                  'https://clipart-library.com/img1/1671008.jpg',
                              //  : roomData!.roomImage!,
                              boxFit: BoxFit.cover,
                              height: 100.h,
                              width: 100.h),
                        ),
                        SizedBox(
                          height: 100.h,
                          width: 270.w,
                          //  color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                  text:
                                      'No. ${_roomController.getAssignRoomModel!.data![index].roomNumber!}',
                                  size: 20.h),
                              MyText(
                                  text:
                                      'Available ? : ${_roomController.getAssignRoomModel!.data![index].roomCapacity}',
                                  size: 16.h),
                              MyText(
                                  text:
                                      'Capacity : ${_roomController.getAssignRoomModel!.data![index].roomType}',
                                  size: 16.h),
                              MyText(
                                  text:
                                      'Price : ${_roomController.getAssignRoomModel!.data![index].roomType}',
                                  size: 16.h)
                            ],
                          ),
                        ).marginOnly(left: 10.h)
                      ],
                    ).marginAll(10.h),
                  )
      
                      //
                      ;
                },
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
