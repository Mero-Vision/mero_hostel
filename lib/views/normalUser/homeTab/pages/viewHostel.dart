// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';
import 'package:mero_hostel/controller/hostel/postHostelController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/controller/owner/room/RoomController.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/skeleton.dart';
import 'package:mero_hostel/views/login/loginPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/hostelModel.dart';

// ignore: must_be_immutable
class ViewHostel extends StatelessWidget {
  ViewHostel({
    Key? key,
    required this.hostelData,
  }) : super(key: key);
  final Datum hostelData;
  final LoginController _controller = Get.find();
  final PostHostelController postHostelController =
      Get.put(PostHostelController());
  RoomController roomController = Get.put(RoomController());
  @override
  Widget build(BuildContext context) {
    roomController.getSingleRoom(hostelData.id.toString());

    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 100.h,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() => MyButton(
                    text: postHostelController.isBooking.value
                        ? 'Requesting.....'
                        : 'Book Now',
                    onTap: () {
                      _controller.isLoggedIn.value
                          ? postHostelController.isBooking.value
                              ? null
                              : postHostelController
                                  .sendBookingReq(hostelData.id!)
                          : Get.to(() => const LoginPage());
                    },
                    right: 10.h,
                  ))
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
                expandedHeight: 200.0.h,
                pinned: true,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                    background: MyImageNetwork(
                        imageUrl: hostelData.hostelImages.toString(),
                        boxFit: BoxFit.cover,
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                        height: double.infinity,
                        blendMode: BlendMode.darken,
                        width: double.infinity)),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return SizedBox(
                      height: 650.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: hostelData.hostelName ?? '',
                            size: 26.h,
                            fontWeight: FontWeight.bold,
                          ).marginOnly(top: 20.h, left: 20.h),
                          MyText(
                            text: hostelData.address ?? '',
                            size: 22.h,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ).marginSymmetric(vertical: 0.h, horizontal: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  priceReviewSec('Price', 'Rs.' + '6000')
                                      .marginOnly(right: 30.h),
                                  priceReviewSec('Reviews', '7.5'),
                                ],
                              ),
                              Row(
                                children: [
                                  _iconButton(
                                          icon: Icons.favorite_border,
                                          onTap: () {})
                                      .marginOnly(right: 10.h),
                                  _iconButton(
                                      icon: CupertinoIcons.phone,
                                      onTap: () async {
                                        final Uri uri = Uri(
                                            path: hostelData.phoneNumber,
                                            scheme: 'tel');
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        } else {
                                          Get.defaultDialog(
                                              title: 'Something Went Wrong!',
                                              content: const Text(
                                                  "Couldn't open Dialer "));
                                        }
                                      })
                                ],
                              ),
                            ],
                          ).marginSymmetric(vertical: 10.h, horizontal: 20.h),

                          //tabs

                          TabBar(
                            tabs: [
                              Tab(text: ' INFO ')
                                  .marginSymmetric(horizontal: 15.h),
                              Tab(text: ' ROOM ')
                                  .marginSymmetric(horizontal: 10.h),
                              Tab(text: 'CONTACT')
                                  .marginSymmetric(horizontal: 10.h),
                            ],
                          ),
                          const SizedBox(height: 20), // Optional spacing
                          Expanded(
                            child: TabBarView(
                              children: [
                                _infoSection(),
                                _roomSection(),
                                _contactSection()
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget _infoSection() {
    return Container(
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Details',
            size: 24.h,
            fontWeight: FontWeight.w600,
          ),
          MyText(
            text:
                'Conveying or northward offending admitting perfectly my. Colonel gravity get thought fat smiling add but. Wonder twenty hunted and put income set desire expect. Am cottage calling my is mistake cousins talking up. Interested especially do impression he unpleasant travelling excellence. All few our knew time done draw ask.',
            size: 20.h,
            fontWeight: FontWeight.w400,
          ).marginOnly(top: 10.h)
        ],
      ).marginSymmetric(vertical: 20.h, horizontal: 25.h),
    );
  }

  Widget _contactSection() {
    return Container(
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Contact',
            size: 24.h,
            fontWeight: FontWeight.w600,
          ),
          MyText(
            text: 'Name : ${hostelData.hostelName}',
            size: 20.h,
            fontWeight: FontWeight.w400,
          ).marginOnly(
            top: 10.h,
          ),
          MyText(
            text: 'Email : ${hostelData.email}',
            size: 20.h,
            fontWeight: FontWeight.w400,
          ).marginOnly(
            top: 10.h,
          ),
          MyText(
            text: 'Phone Number : ${hostelData.phoneNumber}',
            size: 20.h,
            fontWeight: FontWeight.w400,
          ).marginOnly(
            top: 10.h,
          ),
          MyText(
            text: 'Type : ${hostelData.hostelType}',
            size: 20.h,
            fontWeight: FontWeight.w400,
          ).marginOnly(
            top: 10.h,
          )
        ],
      ).marginSymmetric(vertical: 20.h, horizontal: 25.h),
    );
  }

  Widget _roomSection() {
    return Obx(() => roomController.isLoaded.value
        ? ListView.builder(
            itemCount: (roomController.roomsModel!.data!.isEmpty)
                ? 1
                : roomController.roomsModel?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              if (roomController.roomsModel!.data!.isEmpty) {
                return Column(
                  children: [
                    Lottie.network(
                        height: 200.h,
                        width: 200.h,
                        'https://lottie.host/c0772147-04fe-437a-a1b9-6ca2aa57681f/gPqOeSW8tD.json'),
                    MyText(text: 'No Room Found', size: 18.h)
                  ],
                );
              }
              var roomData = roomController.roomsModel?.data?[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Shadow color with opacity
                      spreadRadius: 2.h, // Spread radius
                      blurRadius: 5.h, // Blur radius
                      offset: Offset(
                          0, 3.h), // Offset to control the shadow position
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
                          imageUrl: roomData?.roomImage == ''
                              ? 'https://clipart-library.com/img1/1671008.jpg'
                              : roomData!.roomImage!,
                          boxFit: BoxFit.cover,
                          height: 100.h,
                          width: 100.h),
                    ),
                    Container(
                      height: 100.h,
                      width: 270.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              text: 'No. ${roomData!.roomNumber}', size: 20.h),
                          MyText(
                              text: 'Available ? : ${roomData.availability}',
                              size: 16.h),
                          MyText(
                              text: 'Capacity : ${roomData.capacity}',
                              size: 16.h),
                          MyText(text: 'Price : ${roomData.price}', size: 16.h)
                        ],
                      ),
                    ).marginOnly(left: 10.h)
                  ],
                ).marginAll(10.h),
              ).marginOnly(right: 10.h, left: 10.h, bottom: 10.h);
            },
          )
        : Skeleton(
            widget: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.h)),
                  child: Text("Loading.."),
                ).paddingOnly(bottom: 20.h, right: 20.h, left: 20.h);
              },
            ),
          ));
  }

  Widget _iconButton({required IconData? icon, required Callback onTap}) {
    return CircleAvatar(
      radius: 30.h,
      backgroundColor: const Color(0xffe4edff),
      child: Center(
        child: IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              size: 25.h,
            )),
      ),
    );
  }

  Widget priceReviewSec(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: title,
          size: 22.h,
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
        MyText(
          text: subTitle,
          size: 23.h,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }
}
