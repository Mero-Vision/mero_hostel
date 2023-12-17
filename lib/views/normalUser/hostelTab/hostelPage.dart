import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/normalUser/homeTab/widget/hostelTile.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/widget/filterTab.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/widget/listofHostel.dart';

class HostelPage extends StatelessWidget {
  HostelPage({super.key});
  HostelController controller = Get.put(HostelController());
  LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostels'),
        backgroundColor: KBackgroundColor,
      ),
      floatingActionButton: Obx(
        () => SizedBox(
          height: 60.h,
          width: 200.h,
          child: _loginController.IsLoggedIn.value
              ? FloatingActionButton(
                  backgroundColor: KButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: MyText(
                    color: Colors.white,
                    text: 'Create Hostel',
                    size: 20.h,
                  ),
                  onPressed: () {},
                )
              : SizedBox(),
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FilterTabs(),
            ListOfHostel(
              data: controller.hostels,
            ),
          ],
        ),
      ),
    );
  }
}
