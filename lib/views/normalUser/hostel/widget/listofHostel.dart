import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class ListOfHostel extends StatelessWidget {
  const ListOfHostel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
                    'https://i.pinimg.com/236x/06/fd/9d/06fd9dde192fe02644663c4bda0cf6ca.jpg',
                    fit: BoxFit.cover,
                    height: 130.h,
                    width: 130.h,
                  ),
                ).paddingAll(7.h),
                Column(
                  children: [
                    MyText(
                      text: 'Pcps Hostel',
                      size: 20.h,
                      fontweight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    )
                  ],
                ).marginAll(10.h)
              ],
            ),
          ).paddingAll(10);
        },
      ),
    );
  }
}
