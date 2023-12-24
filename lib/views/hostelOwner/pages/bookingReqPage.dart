// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/owner/ownerController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/models/owner/BookingRequestModel.dart';

class BookingReqPage extends StatelessWidget {
  const BookingReqPage({
    Key? key,
    required this.ownerController,
    required this.userId,
  }) : super(key: key);
  final OwnerController ownerController;
  final int userId;
  @override
  Widget build(BuildContext context) {
   ownerController.getBookingReq(userId);
    /////
    return GetBuilder<OwnerController>(builder: (value) {
      List<Datum>? snapshot = value.bookingRequestModel?.data;
      return Scaffold(
          appBar: AppBar(
            title: Text('Booking Request'),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: snapshot?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _userSection(snapshot, index);
              },
            ).marginOnly(left: 20.h, right: 20.h),
          ));
    });
  }

  Widget _userSection(List<Datum>? snapshot, int index) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: Color.fromARGB(255, 21, 168, 236)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: snapshot?[index].name ?? '',
              size: 24.h,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            MyText(
                text: snapshot?[index].email ?? '',
                color: Colors.white60,
                fontWeight: FontWeight.w500,
                size: 18.h),
            MyText(
                text: snapshot?[index].requested ?? '',
                color: Colors.white60,
                fontWeight: FontWeight.w500,
                size: 18.h)
          ],
        ).paddingAll(20.h),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.done),
              color: Colors.white,
              iconSize: 40.h,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel),
              color: Colors.white,
              iconSize: 40.h,
            )
          ],
        ).paddingOnly(right: 15.h),
      ]),
    );
  }
}
