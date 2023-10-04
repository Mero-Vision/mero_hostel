import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';

class LoginRepo {
    Future<UserModel?> userLogin(String email, String password) async {
    Dio dio = Dio();
    var baseUrl = 'https://merohostel.hancie-phago.com.np/api/login';

    try {
      final response = await dio.post(
        baseUrl,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final resultData = jsonDecode(response.toString());
        final userModel = UserModel.fromJson(resultData);
        print(userModel); // Print the user data for debugging
        return userModel;
      } else {
        // Handle non-200 status codes
        print('Failed to login. Status code: ${response.statusCode}');
        return null; // Return null in case of a failed login attempt
      }
    } catch (error) {
      // Handle Dio errors
      print('Error during login: $error');
      return null; // Return null in case of an error
    }
  }

}