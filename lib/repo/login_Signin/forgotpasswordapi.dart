import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mero_hostel/repo/apis/api.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

class ForgotPasswordApi {
  Api _api = Api();

  Future<ForgotPasswordModel?> sendforgotpassword(String email) async {
    try {
      final response = await _api.sendRequest
          .post("/send-forgot-password-mail", data: {'email': email});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.toString());
        final resultData = ForgotPasswordModel.fromJson(data);

        return resultData;
      } else {
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
