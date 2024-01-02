// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:mero_hostel/controller/hostel/postHostelController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/controller/owner/room/RoomController.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/skeleton.dart';
import 'package:mero_hostel/utils/constant.dart';
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
              MyButton(
                text: 'Book Now',
                onTap: () {
                  _controller.isLoggedIn.value
                      ? postHostelController.sendBookingReq(hostelData.id!)
                      : Get.to(() => const LoginPage());
                },
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
                expandedHeight: 270.0.h,
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
                      height: 500.h,
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
                                Center(child: Text('Content for Tab 3')),
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
      height: 200,
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

  Widget _roomSection({roomData}) {
    return Obx(() => roomController.isLoaded.value
        ? ListView.builder(
            itemCount: (roomController.roomsModel!.data!.isEmpty)
                ? 1
                : roomController.roomsModel?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              if (roomController.roomsModel!.data!.isEmpty) {
                return Container(
                  height: 10,
                  color: Colors.black26,
                );
              }
              var roomData = roomController.roomsModel?.data?[index];
              Container(
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
                      //  color: Colors.green,
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
              ).marginSymmetric(horizontal: 10.h);
            },
          )
        : Skeleton(
            widget: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(15.h)),
            child: SizedBox(),
          ).paddingAll(20.h)));
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
              size: 35.h,
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
// SizedBox(
//                     height: 850.h,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           //   height: 300.h,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(15.h),
//                                 child: MyImageNetwork(
//                                     imageUrl: data.hostelImages ?? '',
//                                     boxFit: BoxFit.cover,
//                                     height: 100.h,
//                                     width: 100.h),
//                               ),
//                               SizedBox(
//                                 //  color: Colors.amberAccent,

//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     MyText(
//                                         text: data.hostelName ?? '',
//                                         size: 24,
//                                         fontWeight: FontWeight.w500),
//                                     MyText(
//                                         text: 'Address: ${data.address}',
//                                         size: 16),
//                                     MyText(
//                                         text: 'Email: ${data.email}', size: 16),
//                                     MyText(
//                                         text: 'Type: ${data.hostelType}',
//                                         size: 16),
//                                     Row(
//                                       children: [
//                                         IconButton(
//                                             onPressed: () {},
//                                             color: Colors.blue,
//                                             iconSize: 40.h,
//                                             icon: Icon(Icons.facebook)),
//                                         IconButton(
//                                             onPressed: () {},
//                                             iconSize: 40.h,
//                                             icon: Icon(
//                                                 Icons.south_america_outlined)),
//                                       ],
//                                     )
//                                   ],
//                                 ).marginOnly(left: 10.h),
//                               ),
//                             ],
//                           ).marginAll(10.h),
//                         ),
//                         SizedBox(
//                             width: double.infinity,
//                             child: Card(
//                               color: Colors.white,
//                               child: const Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   MyText(
//                                     text: 'Features',
//                                     size: 20,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   MyText(text: '', size: 16),
//                                 ],
//                               ).marginAll(10.h),
//                             )),
//                         Expanded(
//                             child: SizedBox(
//                           width: screenWidth,
//                           child: Card(
//                             color: Colors.grey.shade200,
//                             child: const Column(
//                               children: [
//                                 Text('hello'),
//                               ],
//                             ),
//                           ).marginOnly(top: 30.h, bottom: 30.h),
//                         )),
//                         SizedBox(
//                           height: 180.h,
//                           width: double.infinity,
//                           child: Card(
//                             color: Colors.grey.shade100,
//                             child: const Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 MyText(
//                                     text: 'Contact:',
//                                     size: 20,
//                                     fontWeight: FontWeight.w600),
//                               ],
//                             ).marginOnly(left: 10.h, bottom: 10.h),
//                           ),
//                         ).marginOnly(bottom: 20),
//                       ],
//                     ),
//                   ).paddingOnly(top: 20.h, left: 20.h, right: 20.h);
