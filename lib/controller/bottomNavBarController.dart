import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
