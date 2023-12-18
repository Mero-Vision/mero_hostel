// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/views/normalUser/homeTab/pages/viewHostel.dart';

class FilterTabs extends StatelessWidget {
  FilterTabs({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HostelController controller;
  @override
  Widget build(BuildContext context) {
    var boysHostel = controller.getBoysHostel();
    controller.getGirlsHostel();
    var catagories = ['All', 'Boys', 'Girls'];

    var hostelCatagories = [
      controller.hostels,
      controller.boysHostels,
      controller.girlsHostels
    ];

    return Obx(() {
      var hosteldata =
          controller.isEmpty.value ? controller.hostels : controller.catagories;
      return Column(
        children: [
          SizedBox(
            height: 40.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return MyButton(
                  text: catagories[index],
                  onTap: () {
                    print(index);
                    controller.isEmpty.value = false;
                    controller.catagories.value = hostelCatagories[index];
                  },
                  width: 110.h,
                  color: Colors.blue.shade100,
                ).marginOnly(left: 25.h);
              },
            ),
          ).marginOnly(bottom: 10.h, top: 10.h),

          //list of hostel sections
          Expanded(
            // height: 500.h,
            child: ListView.builder(
              itemCount: hosteldata.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ViewHostel(
                                data: controller.isEmpty.value
                                    ? controller.hostels[index]
                                    : hosteldata[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.h),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    height: 130.h,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.h),
                          child: Image.network(
                            hosteldata[index].hostelImages ??
                                'https://i.pinimg.com/236x/06/fd/9d/06fd9dde192fe02644663c4bda0cf6ca.jpg',
                            fit: BoxFit.cover,
                            height: 130.h,
                            width: 130.h,
                          ),
                        ).paddingAll(7.h),
                        Column(
                          children: [
                            MyText(
                              text: hosteldata[index].hostelName ??
                                  'Not Available',
                              size: 20.h,
                              fontweight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            )
                          ],
                        ).marginAll(10.h)
                      ],
                    ),
                  ).paddingAll(10),
                );
              },
            ),
          )
        ],
      );
    });
  }
}
