// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';

import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/utils/constant.dart';

class ViewHostel extends StatelessWidget {
  const ViewHostel({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Datum data;
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = Get.height;
    double ScreenWidth = Get.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100.h,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: data.hostelType.toString(), size: 20),
            Hero(
              tag: 'viewPage_Button',
              child: MyButton(
                text: 'Book Now',
                onTap: () {},
                width: 200.h,
                right: 10.h,
              ),
            )
          ],
        ).marginAll(10.h),
      ),
      body: Stack(children: [
        CustomScrollView(
          slivers: <Widget>[
            //2
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.black,
              centerTitle: true,
              expandedHeight: 300.0,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  data.hostelName.toString(),
                ),
                background: Image.network(
                  data.hostelImages.toString(),
                  color: Color.fromRGBO(0, 0, 0,
                      0.7), // Adjust the last value (opacity) as needed
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Container(
                    height: ScreenHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                            text: 'Address: ' + data.address.toString(),
                            size: 18),
                        MyText(
                            text: 'Email: ' + data.email.toString(), size: 18),
                        MyText(
                            text: 'Type: ' + data.hostelType.toString(),
                            size: 18),
                        MyText(
                            text:
                                'Phone Number: ' + data.phoneNumber.toString(),
                            size: 18),
                        MyText(
                            text: 'Address: ' + data.address.toString(),
                            size: 18),
                      ],
                    ),
                  ).paddingOnly(top: 20.h, left: 20.h);
                },
                childCount: 1,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
