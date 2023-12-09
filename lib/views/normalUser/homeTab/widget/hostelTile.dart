import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/views/normalUser/homeTab/pages/viewHostel.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
    this.data,
  }) : super(key: key);
  final RxList<Datum>? data;
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 320.h,
          width: double.infinity,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                if (index < data!.length - 1 && index < 6) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ViewHostel(data: data![index])));
                    },
                    child: Container(
                      height: 300.h,
                      width: 220.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14)),
                            child: Image.network(
                              data?[index].hostelImages ??
                                  'https://i.pinimg.com/236x/06/fd/9d/06fd9dde192fe02644663c4bda0cf6ca.jpg',
                              fit: BoxFit.cover,
                              height: 190.h,
                              width: 300.h,
                            ),
                          ),
                          MyText(
                            text: data![index].hostelName!,
                            size: 18.h,
                            fontweight: FontWeight.w600,
                          ).marginAll(10.h),
                          MyText(
                                  text: data?[index].address ?? 'unknown',
                                  size: 16.h)
                              .marginOnly(left: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(text: '5.5', size: 16.h)
                                  .marginOnly(left: 10.h),
                              MyButton(
                                // color: Colors.green,

                                fontSize: 18.h,
                                height: 20.h,
                                width: 140.h,
                                text: 'View',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ViewHostel(data: data![index])));
                                },
                              ).marginOnly(right: 10)
                            ],
                          )
                        ],
                      ),
                    ).marginOnly(left: 15.h),
                  );
                }
                if (index == data!.length - 1 || index == 6) {
                  return Container(
                    height: 300.h,
                    width: 260.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: 'View All',
                            size: 20.h,
                            color: Colors.black54,
                            fontweight: FontWeight.bold,
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.black54,
                            size: 40.h,
                          ).marginOnly(left: 10.h)
                        ],
                      ),
                    ),
                  ).marginOnly(right: 10.h, left: 15.h);
                }
                return null;
              }),
        ).marginSymmetric(
          vertical: 10.h,
        ));
  }
}
