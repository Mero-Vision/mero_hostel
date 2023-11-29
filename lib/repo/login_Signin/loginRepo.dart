import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mero_hostel/repo/apis/api.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';

class LoginRepo {
  Future<UserModel?> userLogin(String email, String password) async {
    Api _api = Api();

    try {
      final response = await _api.sendRequest.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
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
