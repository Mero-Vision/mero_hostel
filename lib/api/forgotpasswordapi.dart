import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

class ForgotPasswordApi {
  ForgotPasswordModel? forgotpassworddata;
  final dio = Dio();
  String baseUri =
      'https://merohostel.hancie-phago.com.np/api/send-forgot-password-mail';

  Future<ForgotPasswordModel> sendforgotpassword(String email) async {
    final response = await dio.post(baseUri,
        data: {'email': email},
        options: Options(headers: {'Content-Type': 'application/json'}));

    try {
      if (response.data == 200) {
        print("Success");
        final data = forgotPasswordModelFromJson(jsonEncode(response.data));
        forgotpassworddata = data;
        forgotpassworddata;
      }
    } catch (e) {}
    return forgotpassworddata!;
  }
}
