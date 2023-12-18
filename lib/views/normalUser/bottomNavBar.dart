// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations/animations.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mero_hostel/controller/bottomNavBarController.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/views/login/loginPage.dart';
import 'package:mero_hostel/views/normalUser/homeTab/pages/homepage.dart';
import 'package:mero_hostel/views/normalUser/hostelTab/hostelPage.dart';
import 'package:mero_hostel/views/normalUser/profileTab/profileScreen.dart';
import 'package:mero_hostel/views/normalUser/searchTab/searchPage.dart';

class BottomNavBar extends StatelessWidget {

   BottomNavBar({
    Key? key,
    this.userValue,
  }) : super(key: key);

final User? userValue;
  final BottomNavBarController controller = Get.put(BottomNavBarController());
  final LoginController _loginController=Get.find();
  

  @override
  Widget build(BuildContext context) {
      final List<Widget> tabItems = [
    const HomePage(),
    SearchPage(),
    HostelPage(),
   (_loginController.IsLoggedIn.value? ProfileScreen(userData:userValue ,):LoginPage())
  ];

    return Scaffold(
      body: Obx(
        () => PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              transitionType: SharedAxisTransitionType.vertical,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: tabItems[controller.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(() => FlashyTabBar(
            animationCurve: Curves.linear,
            selectedIndex: controller.selectedIndex.value,
            iconSize: 25.0,
            animationDuration: const Duration(milliseconds: 250),
            showElevation: false,
            onItemSelected: (index) => controller.changeTabIndex(index),
            items: [
              FlashyTabBarItem(
                icon: const Icon(Icons.home_filled),
                title: const Text('Home'),
              ),
              FlashyTabBarItem(
                icon: const Icon(CupertinoIcons.search),
                title: const Text('Search'),
              ),
              FlashyTabBarItem(
                icon: const Icon(CupertinoIcons.building_2_fill),
                title: const Text('Hostel'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
              ),
            ],
          )),
    );
  }
}
