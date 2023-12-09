import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/repo/hostel/HostelRepo.dart';

class XTest extends StatelessWidget {
  const XTest({super.key});

  @override
  Widget build(BuildContext context) {
    HostelController controller = Get.put(HostelController());
    controller.getAllHostel();
    return Scaffold(
      body: Column(
        children: [
          MyButton(
              text: "tap me ",
              onTap: () {
                print('hello');
                HostelRepo().getAllHostel();
              }),
          Obx(
            () => Container(
              height: 200,
              child: ListView.builder(
                itemCount: controller.hostels.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyText(
                      text: controller.hostels[index].hostelName.toString(),
                      size: 16);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
