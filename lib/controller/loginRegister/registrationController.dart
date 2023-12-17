import 'package:get/get.dart';
import 'package:mero_hostel/repo/login_Signin/Signup.dart';

class RegistrationController extends GetxController {
  RxBool isLoading = false.obs;
  SignupUser signupUser = SignupUser();

  sendRegistrationRequest(String name, String email, String password,
      String confirmPassword) async {
    isLoading.value = true;
    var status = await signupUser.postRegistration(
        name, email, password, confirmPassword);
    isLoading.value = false;
    return status;
  }
}
