import 'package:dio/dio.dart';

import 'package:mero_hostel/repo/apis/AuthApi.dart';

class ChangeUserStatus {
  AuthApi _api = AuthApi();

  Future<bool> sendChangeRequest(
      String email, String status, String token) async {
    try {
      var response = await _api.sendRequest.post(
        '/admin/user/status/update',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $token', // Add your API key here
          },
        ),
        data: {
          'email': email,
          'status': status,
        },
      );
      if (response.statusCode == 200) {
        print('user status changed ');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
