// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mero_hostel/controller/owner/ownerController.dart';
import 'package:mero_hostel/controller/owner/room/RoomController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/skeleton.dart';
import 'package:mero_hostel/models/owner/BookingRequestModel.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/hostelOwner/pages/rooms/userAssignRoom.dart';

class BookingReqPage extends StatelessWidget {
  BookingReqPage({
    Key? key,
    required this.ownerController,
    required this.userId,
  }) : super(key: key);
  final OwnerController ownerController;
  final int userId;
  final RoomController _roomController = Get.put(RoomController());
  @override
  Widget build(BuildContext context) {
    ownerController.getBookingReq(userId);
    /////
    return GetBuilder<OwnerController>(builder: (value) {
      List<Datum>? snapshot = value.bookingRequestModel?.data;
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Booking Request'),
          ),
          body: value.isDataLoaded
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: snapshot!.isNotEmpty ? snapshot.length : 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot!.isNotEmpty) {
                        return _userSection(snapshot, index)
                            .marginOnly(top: 20.h);
                      }
                      return SvgPicture.asset('assets/images/waitingReq.svg');
                    },
                  ).marginOnly(left: 20.h, right: 20.h),
                )
              : Skeleton(
                  widget: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 100,
                        child: Card(
                          child: Container(),
                        ),
                      ).marginOnly(top: 10.h, left: 10.h, right: 10.h);
                    },
                  ),
                ));
    });
  }

  Widget _userSection(List<Datum>? snapshot, int index) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15.h),
          color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            300.h,
          ),
          child: MyImageNetwork(
              imageUrl: AppConstants.userImageDummy,
              boxFit: BoxFit.cover,
              height: 70.h,
              width: 70.h),
        ).marginOnly(left: 15.h),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: snapshot?[index].name ?? '',
              size: 24.h,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            MyText(
                text: snapshot?[index].email ?? '',
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                size: 18.h),
            MyText(
                text: snapshot?[index].requested ?? '',
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                size: 18.h)
          ],
        ).paddingOnly(top: 20.h),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                var check = await _roomController.approveUser(
                  bookingId: snapshot?[index].id ?? 0,
                );

                if (check) {
                  Get.to(() => UserAssignRoom(
                        userName: snapshot?[index].name ?? '',
                        userId: userId,
                        hostelId: ownerController.hostelData?.data?[0].id ?? 0,
                      ));
                }
              },
              icon: Icon(Icons.done),
              color: Colors.green,
              iconSize: 40.h,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel_outlined),
              color: Colors.red,
              iconSize: 40.h,
            )
          ],
        ).paddingOnly(right: 15.h),
      ]),
    );
  }
}
