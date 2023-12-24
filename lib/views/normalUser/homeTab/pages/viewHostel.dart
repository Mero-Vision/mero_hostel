// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/login/loginPage.dart';
import 'package:mero_hostel/views/normalUser/profileTab/widgets/topsection.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class ViewHostel extends StatelessWidget {
  ViewHostel({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Datum data;
  final LoginController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100.h,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                final Uri uri = Uri(path: data.phoneNumber, scheme: 'tel');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  Get.defaultDialog(
                      title: 'Something Went Wrong!',
                      content: const Text("Couldn't open Dialer "));
                }
              },
              child: Container(
                  height: 55.h,
                  width: 150.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: Icon(
                    CupertinoIcons.phone_circle_fill,
                    size: 50.h,
                    color: Colors.white,
                  )),
            ),
            MyButton(
              text: 'Book Now',
              onTap: () {
                _controller.isLoading.value
                    ? null
                    : Get.to(() => const LoginPage());
              },
              width: 180.h,
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                  MyText(
                                      text:
                                          'This is the hostel where we have free food and free ac for each and every room  its located at kathmandu the students health are highly prioritized where we have free food and free ac for each and every room sinc its located at kathmandu the students health are highly priori ',
                                      size: 16),
                                ],
                              ).marginAll(10.h),
                            )),
                        Expanded(
                            child: SizedBox(
                          width: screenWidth,
                          child: Card(
                            color: Colors.grey.shade200,
                            child: const Column(
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
                                    fontWeight: FontWeight.w600),
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
