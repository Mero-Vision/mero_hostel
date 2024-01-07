import 'package:get/get.dart';
import 'package:mero_hostel/models/hostel_user/hostelUserDataModel.dart';
import 'package:mero_hostel/repo/hostel_user_repo/hostel_user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HostelUserController extends GetxController {
  HostelUserRepo hostelUserRepo = HostelUserRepo();
  HostelUserDataModel hostelUserDataModel = HostelUserDataModel();
  Future getHostelUserData({required int userId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var accessToken = preferences.getString('AccessToken');
    var response = await hostelUserRepo.getHostelUserData(userId, accessToken!);
    hostelUserDataModel = response;
    update();
  }
}
