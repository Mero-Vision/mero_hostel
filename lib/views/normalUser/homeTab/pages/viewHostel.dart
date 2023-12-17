import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/hostelModel.dart';

class ViewHostel extends StatelessWidget {
  const ViewHostel({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Datum data;
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double ScreenWidth = Get.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100.h,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: 'Total:RS 10000', size: 24),
            MyButton(
              text: 'Book Now',
              onTap: () {},
              width: 200.h,
              right: 10.h,
            )
          ],
        ).marginAll(10.h),
      ),
      body: Stack(children: [
        CustomScrollView(
          slivers: <Widget>[
            //2
            SliverAppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.black,
              centerTitle: false,
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  data.hostelName.toString(),
                  style: TextStyle(fontSize: 20.h),
                ),
                background: Image.network(
                  data.hostelImages.toString(),
                  color: const Color.fromRGBO(0, 0, 0,
                      0.2), // Adjust the last value (opacity) as needed
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return SizedBox(
                    height: 850.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Colors.grey.shade200,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: 'Description',
                                    size: 20,
                                    fontweight: FontWeight.w600,
                                  ),
                                  MyText(
                                      text:
                                          'This is the hostel where we have free food and free ac for each and every room sinc its located at kathmandu the students health are highly prioritized where we have free food and free ac for each and every room sinc its located at kathmandu the students health are highly priori ',
                                      size: 16),
                                ],
                              ).marginAll(10.h),
                            )),
                        Expanded(
                            child: SizedBox(
                          width: ScreenWidth,
                          child: Card(
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                Text('hello'),
                              ],
                            ),
                          ).marginOnly(top: 30.h, bottom: 30.h),
                        )),
                        SizedBox(
                          height: 180.h,
                          width: double.infinity,
                          child: Card(
                            color: Colors.grey.shade100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                    text: 'Contact:',
                                    size: 20,
                                    fontweight: FontWeight.w600),
                                MyText(
                                    text: 'Address: ${data.address}', size: 16),
                                MyText(text: 'Email: ${data.email}', size: 16),
                                MyText(
                                    text: 'Type: ${data.hostelType}', size: 16),
                                MyText(
                                    text: 'Phone Number: ${data.phoneNumber}',
                                    size: 18),
                              ],
                            ).marginOnly(left: 10.h, bottom: 10.h),
                          ),
                        ).marginOnly(bottom: 20),
                      ],
                    ),
                  ).paddingOnly(top: 20.h, left: 20.h, right: 20.h);
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