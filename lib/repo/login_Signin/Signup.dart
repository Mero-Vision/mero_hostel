import 'package:get/get.dart';
import 'package:mero_hostel/repo/apis/api.dart';

class SignupUser {
  Api api = Api();
  Future postRegistration(String name, String email, String password,
      String confirmPassword) async {
    try {
      var response = await api.sendRequest.post(
        '/users',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword
        },
      );
      if (response.statusCode == 200) {
        Get.snackbar('User 123', 'Successfully created',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('User 123', 'Something Went Wrong',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {}
  }
}
