import 'package:get/get.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/repo/user/changeStatus.dart';

class UserController extends GetxController {
  Future<bool> changeUserStatus(String email, String status, String token) async {
    var data = await ChangeUserStatus().sendChangeRequest(email, status,token);

    return data;
  }
}
