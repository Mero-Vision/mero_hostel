import 'package:dio/dio.dart';
import 'package:mero_hostel/models/owner/allUserOnHostel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class AllUserOnHostelRepo {
  AuthApi _authApi = AuthApi();
  Future<AllUserOnHostel> getAllUserOnHostel(
      {required String accessToken, required int hostelId}) async {
    try {
      var response = await _authApi.sendRequest.get(
        '/admin/users?hostel_id=$hostelId',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = AllUserOnHostel.fromJson(response.data);
        return data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
