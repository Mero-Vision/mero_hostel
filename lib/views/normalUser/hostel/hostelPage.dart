import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/utils/constant.dart';

class HostelPage extends StatelessWidget {
  const HostelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
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
          onPressed: () {
            
          },
        ),
      ),
      body: Container(),
    );
  }
}
