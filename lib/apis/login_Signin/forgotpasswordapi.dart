import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mero_hostel/models/forgotPasswordModel.dart';

class ForgotPasswordApi {
  final dio = Dio();
  String baseUri =
      'https://merohostel.hancie-phago.com.np/api/send-forgot-password-mail';

  Future<ForgotPasswordModel?> sendforgotpassword(String email) async {
    try {
      final response = await dio.post(baseUri,
          data: {'email': email},
          options: Options(headers: {'Content-Type': 'application/json'}));

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
