// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:mero_hostel/controller/owner/ownerController.dart';
import 'package:mero_hostel/controller/utilController/bottomNavBarController.dart';
import 'package:mero_hostel/controller/hostel/ImageController.dart';
import 'package:mero_hostel/controller/hostel/hostelController.dart';
import 'package:mero_hostel/controller/hostel/postHostelController.dart';
import 'package:mero_hostel/controller/loginRegister/forgotpasswordController.dart';
import 'package:mero_hostel/controller/loginRegister/registrationController.dart';

class MyControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize your controllers or dependencies here
    Get.put(HostelController());
    Get.lazyPut(() => ImageController());
    Get.lazyPut(
      () => PostHostelController(),
    );

    Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(
      () => RegistrationController(),
    );
    Get.put(BottomNavBarController(), permanent: true);
    Get.put(
      OwnerController(),
    );

    //Get.lazyPut(() => BottomNavBarController(),);

    //Get.lazyPut(() => HomepageController());
    //permanent: true
  }
}
