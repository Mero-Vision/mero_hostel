import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = Get.height;
    double ScreenWidth = Get.width;
    LoginController controller = Get.put(LoginController());
    User userData = controller.user.value!.data.user;
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: Text('Welcome ' + userData.name)),
      body: Container(
        height: ScreenHeight,
        width: ScreenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userData.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userData.email),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userData.status),
            )
          ],
        ),
      ),
    );
  }
}
