// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:mero_hostel/repo/hostel/postHostelRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostHostelController extends GetxController {
  final PostHostelApi _postHostelApi = PostHostelApi();
  Future createHostel(
      String hostelNameController,
      String hostelAddressController,
      String hostelPhoneController,
      String hostelEmailController,
      String hostelWebsiteController,
      String hostelTypeController,
      String hostelImageData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('AccessToken');
    return await _postHostelApi.postHostel(
        hostelNameController,
        hostelAddressController,
        hostelPhoneController,
        hostelEmailController,
        hostelWebsiteController,
        hostelTypeController,
        hostelImageData,
        token!);
  }
}
