import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';

class DialogController {
  static void showDoneSimpleDialog(String title, String successMsg) {
    Get.defaultDialog(
        title: title,
        confirm: MyButton(
            text: 'CONTINUE',
            onTap: () {
              Get.back();
            }),
        content: Column(
          children: [
            SvgPicture.asset(
              'assets/icons/Green_Tick_Svg.svg',
              height: 80,
              width: 80,
            ),
            Text(successMsg),
          ],
        ));
  }

  static void showErrorSimpleDialog(String title, String errorMsg) {
    Get.defaultDialog(
        title: title,
        confirm: MyButton(
            text: 'CONTINUE',
            onTap: () {
              Get.back();
            }),
        content: Column(
          children: [
            Image.asset(
              'assets/icons/Red_Cross.png',
              height: 80,
              width: 80,
            ),
            Text(errorMsg),
          ],
        ));
  }

  static void showConfirmationDialog(
      String title, String message, Function onConfirm) {
    Get.defaultDialog(
      title: title,
      content: Text(message),
      textConfirm: 'Confirm',
      textCancel: 'Cancel',
      onConfirm: () {
        onConfirm();
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
}
