// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';
import 'package:mero_hostel/controller/utilController/searchController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myImageNetwork.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/views/normalUser/homeTab/pages/viewHostel.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final SearchControllers searchController = Get.put(SearchControllers());
  final HostelController hostelController = Get.put(HostelController());
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    Timer? _debounce;
    onSearchChanged() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 800), () {
        // Execute API call here
        print("API Call");
        searchController.search(controller.text.trim());
      });
    }

    controller.addListener(() {
      onSearchChanged();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: MyTextFormField(
          hintText: 'Search',
          controller: controller,
          onChanged: (value) {
            searchController.dataList == [];
          },
          prefix: Icon(
            CupertinoIcons.search,
            size: 25.h,
            // color: Colors.black,
          ),
        ),
      ),
      body: Obx(() => searchController.isLoaded.value
          ? ListView.builder(
              itemCount: searchController.dataList.length,
              itemBuilder: (BuildContext context, int index) {
                var searchData = searchController.dataList[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ViewHostel(
                        hostelData: searchController.dataList[index]!));
                  },
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.h)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.h),
                          child: MyImageNetwork(
                              imageUrl: searchData?.hostelImages ?? '',
                              boxFit: BoxFit.cover,
                              height: 100.h,
                              width: 100.h),
                        ).marginOnly(left: 10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                text: searchData?.hostelName ?? '',
                                size: 22.h,
                                fontWeight: FontWeight.w700),
                            MyText(text: searchData?.address ?? '', size: 18.h),
                            MyText(
                                text: searchData?.hostelType ?? '', size: 18.h),
                          ],
                        ).marginAll(10.h)
                      ],
                    ),
                  ).marginAll(20.h),
                );
                // Text(searchController.dataList[index]?.hostelName ?? '')
              },
            )
          : Center(
              child: Lottie.network(
                  'https://lottie.host/4bac5f86-2f26-4c3f-b2a6-ad549ebdcadd/tR7YKFJ4yN.json'),
            )),
    );
  }
}
