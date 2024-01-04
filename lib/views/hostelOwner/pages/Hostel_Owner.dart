// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/controller/owner/ownerController.dart';
import 'package:mero_hostel/controller/owner/room/RoomController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/hostelOwner/pages/bookingReqPage.dart';
import 'package:mero_hostel/views/hostelOwner/pages/rooms/hostelRoom.dart';
import 'package:mero_hostel/views/hostelOwner/widgets/listHosteldata.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/home_appbar.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/hostelPage.dart';

// ignore: must_be_immutable
class HostelOwner extends StatelessWidget {
  HostelOwner({
    Key? key,
    required this.userDataModel,
  }) : super(key: key);
  final UserDataModel userDataModel;
  LoginController controller = Get.find();
  OwnerController ownerController = Get.put(OwnerController());
  RoomController roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = AppSize.KScreenHeight.h;
    double screenWidth = AppSize.KScreenWidth.w;
    var userData = userDataModel.data;
    ownerController.getOwnerHostel(userData!.id!).then(
        (value) => roomController.getSingleRoom(value!.data![0].id.toString()));

    ownerController.getBookingReq(userData.id ?? 0);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: GetBuilder<OwnerController>(builder: (context) {
        return SafeArea(
            child: _OwnerDrawer(ownerController.hostelData?.data?[0]));
      }),
      appBar: AppBar(
        title: HomeAppBar(
          username: 'Welcome ${userData.name}',
          userImageURL: userData.profileImage,
          userData: userData,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              //       init: ownerController,

              SizedBox(
            height: screenHeight - 60.h,
            width: screenWidth,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    expenseManagement(),
                    GetBuilder<OwnerController>(builder: (value) {
                      return _bookingRequest(
                        onTap: () async {
                          //
                          Get.to(() => BookingReqPage(
                                ownerController: value,
                                userId: userData.id!,
                              ));
                        },
                      );
                    }),
                  ],
                ).marginOnly(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _userTab(),
                    GetBuilder<RoomController>(builder: (value) {
                      return _roomTab("  ${value.numOfRooms} Room's ")
                          .marginOnly(right: 10.h);
                    })
                  ],
                ).marginOnly(left: 10.w, bottom: 10.h),
                const ListHostelData(),
                const ListHostelData(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roomTab(String text) {
    return Material(
      borderRadius: BorderRadius.circular(15.h),
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: const CachedNetworkImageProvider(
          'https://i.pinimg.com/564x/19/60/a2/1960a2a28791b90183228c587e1b30a0.jpg',
        ),
        colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
        fit: BoxFit.cover,
        width: 200.w,
        height: 200.h,
        child: InkWell(
          onTap: () {
            Get.to(() => HostelRoomPage(
                  hostelId:
                      ownerController.hostelData?.data?[0].id.toString() ?? '',
                ));
          },
          borderRadius: BorderRadius.circular(15.h),
          child: Container(
            width: 200.w,
            height: 200.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userTab() {
    return Material(
      borderRadius: BorderRadius.circular(15.h),
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: const CachedNetworkImageProvider(
          'https://i.pinimg.com/564x/bb/41/75/bb4175bb273bce5a16600200d8c6369b.jpg',
        ),
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
        fit: BoxFit.cover,
        width: 200.w,
        height: 200.h,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15.h),
          child: Container(
            width: 200.w,
            height: 200.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
                Text(
                  "  User's",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget expenseManagement() {
    return Material(
      borderRadius: BorderRadius.circular(15.h),
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: const CachedNetworkImageProvider(
          'https://i.pinimg.com/564x/18/61/c7/1861c716c6dc85f6bddb640812d8eac7.jpg',
        ),
        colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.darken),
        fit: BoxFit.cover,
        width: 200.w,
        height: 200.h,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15.h),
          child: Container(
            width: 200.w,
            height: 200.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.white,
                ),
                Text(
                  " 0 Balance",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bookingRequest({Callback? onTap}) {
    return Material(
      borderRadius: BorderRadius.circular(15.h),
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: const CachedNetworkImageProvider(
          'https://i.pinimg.com/564x/da/fd/fd/dafdfd663c7c4076f2624777878d57dd.jpg',
        ),
        colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.darken),
        fit: BoxFit.cover,
        width: 200.w,
        height: 200.h,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.h),
          child: Container(
            width: 200.w,
            height: 200.h,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
                GetBuilder<OwnerController>(builder: (value) {
                  return Text(
                    " ${ownerController.bookingRequestModel?.data?.length ?? 0} Booking ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _OwnerDrawer(hostelData) {
    return Drawer(
        shape: const Border(),
        backgroundColor: Colors.white,
        child: SizedBox(
            width: 200.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: AppSize.KScreenWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.h),
                        child: MyImageNetwork(
                            imageUrl: hostelData?.hostelImages ??
                                'https://i.pinimg.com/564x/04/dd/5b/04dd5bf46aeb55c60918da9efd2bd3d7.jpg',
                            boxFit: BoxFit.cover,
                            height: 100.h,
                            width: 100.h),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: hostelData?.hostelName ?? 'NoName',
                            size: 22.h,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            text: hostelData?.email ?? 'NoEmail',
                            size: 18.h,
                            fontWeight: FontWeight.w300,
                          )
                        ],
                      ).marginOnly(left: 10.h)
                    ],
                  ).paddingOnly(
                      right: 10.h, left: 10.h, top: 20.h, bottom: 20.h),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => HostelPage());
                  },
                  leading: Icon(
                    CupertinoIcons.house_alt_fill,
                    color: Colors.orange.shade800,
                  ),
                  tileColor: Colors.white,
                  title: const Text('All Hostels'),
                ).paddingOnly(top: 10.h),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                  ),
                  tileColor: Colors.white,
                  title: const Text('LogOut'),
                ).paddingOnly(top: 10.h),
              ],
            )));
  }
}
