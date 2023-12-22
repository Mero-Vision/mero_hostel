// ignore_for_file: file_names
import 'dart:convert';
import 'package:mero_hostel/repo/apis/api.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';

class LoginRepo {
  final Api _api = Api();
  Future<UserModel?> userLogin(String email, String password) async {
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

        return userModel;
      } else {
        // Handle non-200 status codes
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle Dio errors
      throw Exception('Error during login: $error');
    }
  }
}
