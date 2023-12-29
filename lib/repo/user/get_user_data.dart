import 'package:dio/dio.dart';
import 'package:mero_hostel/models/LoginUserModel.dart';
import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class GetUserData {
  AuthApi _api = AuthApi();

  Future<UserDataModel> getUserInfo(
      {required String accessToken, required String userId}) async {
    try {
      var response = await _api.sendRequest.get(
        '/admin/user/${userId}',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = UserDataModel.fromJson(response.data);

        return data;
      } else {
        throw Exception(
            'Received unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load hostels: $e');
    }
  }
}
