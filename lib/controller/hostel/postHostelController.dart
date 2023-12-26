import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/repo/hostel/postHostelRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostHostelController extends GetxController {
  PostHostelApi _postHostelApi = PostHostelApi();

  Future createHostel(
      String hostelNameController,
      String hostelAddressController,
      String hostelPhoneController,
      String hostelEmailController,
      String hostelWebsiteController,
      String hostelTypeController,
      File hostelImageData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('AccessToken');

    var data = await _postHostelApi.postHostel(
        hostelNameController,
        hostelAddressController,
        hostelPhoneController,
        hostelEmailController,
        hostelWebsiteController,
        hostelTypeController,
        hostelImageData,
        token!);
    print('HostelCreated');
    return data;
  }

  Future sendBookingReq(int hostelId) async {
    PostHostelApi postHostelApi = PostHostelApi();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('AccessToken');
    var data = await postHostelApi.sendBookingReq(hostelId, token!);
    if (data?.message == "You have requested the hostel successfully!") {
      Get.defaultDialog(
          title: 'Success!', content: Text("Booking Requested !!"));
    }
    if (data?.message == 'You have already requested this hostel') {
      Get.defaultDialog(title: 'Success!', content: Text("Already requested"));
    }
  }

  Future deleteHostel() async {
      ////
     ////
    ////
   ////
  ////
  }
}
