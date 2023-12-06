import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/normalUser/hostel/widget/filterTab.dart';
import 'package:mero_hostel/views/normalUser/hostel/widget/listofHostel.dart';

class HostelPage extends StatelessWidget {
  const HostelPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostels'),
        backgroundColor: KBackgroundColor,
      ),
      floatingActionButton: SizedBox(
        height: 60.h,
        width: 200.h,
        child: FloatingActionButton(
          backgroundColor: KButtonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: MyText(
            color: Colors.white,
            text: 'Create Hostel',
            size: 20.h,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [FilterTabs(), ListOfHostel()],
        ),
      ),
    );
  }
}
