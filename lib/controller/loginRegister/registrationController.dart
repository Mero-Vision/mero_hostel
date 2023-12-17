import 'package:get/get.dart';
import 'package:mero_hostel/repo/login_Signin/Signup.dart';

class RegistrationController extends GetxController {
  SignupUser signupUser = SignupUser();
  sendRegistrationRequest(String name, String email, String password,
      String confirmPassword) async {
    signupUser.postRegistration(name, email, password, confirmPassword);
  }
}
