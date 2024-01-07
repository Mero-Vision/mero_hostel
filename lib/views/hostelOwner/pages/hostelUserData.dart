import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/models/owner/allUserOnHostel.dart';
import 'package:mero_hostel/utils/constant.dart';

class HostelUserDataPage extends StatelessWidget {
  const HostelUserDataPage({super.key, required this.allUserOnHostel});
  final List<Datum> allUserOnHostel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: usersGrid().marginAll(15.h));
  }

  Widget usersGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: allUserOnHostel.length, // Number of grid items
      itemBuilder: (BuildContext context, int index) {
        // Replace this with your grid item widget
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15.h),
              color: Colors.white12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: MyImageNetwork(
                    imageUrl: allUserOnHostel[index].profileImage != ''
                        ? allUserOnHostel[index].profileImage!
                        : AppConstants.userImageDummy,
                    boxFit: BoxFit.cover,
                    height: 130.h,
                    width: double.infinity),
              ),
              MyText(
                      text: 'Name: ${allUserOnHostel[index].name ?? 0}',
                      size: 18.h)
                  .marginOnly(left: 10),
              MyText(
                      text:
                          'RoomNumber: ${allUserOnHostel[index].userRoom?.roomId ?? 0}',
                      size: 16.h)
                  .marginOnly(left: 10)
            ],
          ),
        );
      },
    );
  }
}
