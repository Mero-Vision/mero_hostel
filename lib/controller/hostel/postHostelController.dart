// ignore: file_names
import 'dart:io';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/dialoug_controller.dart';
import 'package:mero_hostel/repo/hostel/postHostelRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostHostelController extends GetxController {
  PostHostelApi _postHostelApi = PostHostelApi();
  RxBool isBooking = false.obs;

  Future createHostel(
      String hostelNameController,
      String hostelAddressController,
      String hostelPhoneController,
      String hostelEmailController,
      String hostelWebsiteController,
      String hostelTypeController,
      File hostelImageData) async {
    isBooking.value = true;
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

    if (data != null) {
      isBooking.value = false;
      DialogController.showDoneSimpleDialog('Success !', 'Hostel Created.');
      return data;
    } else {
      DialogController.showErrorSimpleDialog(
          'Oops !', 'Some Thing Went Wrong.');
    }
  }

  Future sendBookingReq(int hostelId) async {
    isBooking.value = true;

    PostHostelApi postHostelApi = PostHostelApi();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('AccessToken');
    var data = await postHostelApi.sendBookingReq(hostelId, token!);
    if (data?.message == "You have requested the hostel successfully!") {
      DialogController.showDoneSimpleDialog('Success!', 'Booking Requested !');
      isBooking.value = false;
    } else {
      DialogController.showErrorSimpleDialog('Booking!', 'Already Booked');
      isBooking.value = false;
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
