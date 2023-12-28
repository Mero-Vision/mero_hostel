import 'package:get/get.dart';
import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/repo/user/changeStatus.dart';
import 'package:mero_hostel/repo/user/get_user_data.dart';

class UserController extends GetxController {
  UserDataModel? userData;

  Future<UserDataModel> getUserInfo(
      {required String accessToken, required int userId}) async {
    var data = await GetUserData()
        .getUserInfo(accessToken: accessToken, userId: userId);
    userData = data;
    update();
    return data;
  }

  Future<bool> changeUserStatus(
      String email, String status, String token) async {
    var data = await ChangeUserStatus().sendChangeRequest(email, status, token);

    return data;
  }
}
