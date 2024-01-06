import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class InternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _connectivity.onConnectivityChanged.listen(updateInternetStatus);
  }

  // Method to update the internet status
  void updateInternetStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.wifi_slash),
              SizedBox(
                width: 10,
              ),
              MyText(text: 'No Internet Connection', size: 20),
            ],
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red.shade400,
          snackStyle: SnackStyle.GROUNDED);
    } else if (Get.isSnackbarOpen) {
      Get.rawSnackbar(
          messageText: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.wifi, color: Colors.white),
              SizedBox(
                width: 10,
              ),
              MyText(text: 'CONNECTED', color: Colors.white, size: 20),
            ],
          ),
          isDismissible: true,
          duration: const Duration(seconds: 1),
          // icon: const Icon(CupertinoIcons.wifi),
          backgroundColor: Colors.green.shade400,
          snackStyle: SnackStyle.GROUNDED);
      Get.closeCurrentSnackbar();
    }
  }
}
