import 'package:get/get.dart';
import 'package:mero_hostel/models/owner/allUserOnHostel.dart';
import 'package:mero_hostel/repo/owner/allUserOnHostelRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOnHostel extends GetxController {
  AllUserOnHostel? allUserOnHostel;
  AllUserOnHostelRepo allUserOnHostelRepo = AllUserOnHostelRepo();
  Future getAllUserOnHostel(int hostelId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('AccessToken');
    var response = await allUserOnHostelRepo.getAllUserOnHostel(
        accessToken: accessToken!, hostelId: hostelId);
    allUserOnHostel = response;
    update();
  }
}
