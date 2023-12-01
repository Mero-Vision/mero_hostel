import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      width: double.infinity,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              height: 250.h,
              width: 220.w,
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
                      'https://i.pinimg.com/564x/59/93/73/599373692db3344b5e4b659bbadd4921.jpg',
                      fit: BoxFit.cover,
                      height: 190.h,
                      width: 220.w,
                    ),
                  ),
                  MyText(
                    text: 'Pcps Hostel',
                    size: 18.sp,
                    fontweight: FontWeight.w600,
                  ).marginAll(10.sp),
                  MyText(text: 'kupondole', size: 16.sp).marginOnly(left: 10.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(text: '5.5', size: 16.sp).marginAll(10.sp),
                      MyText(text: 'Rs' + '20000', size: 16.sp).marginAll(10.sp)
                    ],
                  )
                ],
              ),
            ).marginOnly(left: 15);
          }),
    ).marginSymmetric(
      vertical: 10.h,
    );
  }
}
