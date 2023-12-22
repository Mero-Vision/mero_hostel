import 'dart:convert';

import 'package:mero_hostel/repo/apis/api.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

class ForgotPasswordApi {
  final Api _api = Api();

  Future<ForgotPasswordModel?> sendForgotPassword(String email) async {
    try {
      final response = await _api.sendRequest
          .post("/send-forgot-password-mail", data: {'email': email});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.toString());
        final resultData = ForgotPasswordModel.fromJson(data);

        return resultData;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
