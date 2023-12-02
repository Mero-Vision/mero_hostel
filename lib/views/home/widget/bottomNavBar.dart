import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/bottomNavBarController.dart';
import 'package:mero_hostel/views/home/homepage.dart';
import 'package:mero_hostel/views/login/loginPage.dart';
import 'package:mero_hostel/views/settings/settings.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  final List<Widget> tabItems = [
    HomePage(),
    SecondScreen(),
    LoginPage(),
    SecondScreen(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
            animationDuration: Duration(milliseconds: 250),
            showElevation: false,
            onItemSelected: (index) => controller.changeTabIndex(index),
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home_filled),
                title: Text('Home'),
              ),
              FlashyTabBarItem(
                icon: Icon(CupertinoIcons.search),
                title: Text('Search'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
              FlashyTabBarItem(
                icon: Icon(CupertinoIcons.building_2_fill),
                title: Text('Hostel'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          )),
    );
  }
}
