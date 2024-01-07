import 'package:dio/dio.dart';
import 'package:mero_hostel/models/hostel_user/hostelUserDataModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class HostelUserRepo {
  AuthApi _authApi = AuthApi();

  Future<HostelUserDataModel> getHostelUserData(
      int userId, String accessToken) async {
    try {
      var response = await _authApi.sendRequest.get(
        '/admin/user-room-detail?user_id=$userId',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = HostelUserDataModel.fromJson(response.data);
        return data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
