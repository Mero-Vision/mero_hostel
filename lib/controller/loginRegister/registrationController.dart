import 'package:get/get.dart';
import 'package:mero_hostel/repo/login_Signin/Signup.dart';

class RegistrationController extends GetxController {
  RxBool isLoading = false.obs;
  SignUpUser signUpUser = SignUpUser();

  sendRegistrationRequest(String name, String email, String password,
      String confirmPassword) async {
    isLoading.value = true;
    var status = await signUpUser.postRegistration(
        name, email, password, confirmPassword);
    isLoading.value = false;
    return status;
  }
}
