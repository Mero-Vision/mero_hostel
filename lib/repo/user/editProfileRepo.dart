import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mero_hostel/models/user/user_model.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class EditProfileRepo {
  final AuthApi _api = AuthApi();

  Future<UserDataModel?> editProfileRequest(
      {required String newName,
      required String newEmail,
      required File? newProfile,
      required String userId,
      required String token}) async {
    FormData data;
    if (newProfile == null) {
      data = FormData.fromMap({
        'name': newName,
        'email': newEmail,
        '_method': 'put'
      });
    } else {
      data = FormData.fromMap({
        'profile_image': await MultipartFile.fromFile(
          newProfile.path,
          filename: newProfile.path,
        ),
        'name': newName,
        'email': newEmail,
        '_method': 'put'
      });
    }
    try {
      var response = await _api.sendRequest.post(
        '/admin/user/$userId', // Replace with your actual endpoint
        data: data,
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $token', // Add your API key here
          },
        ),
      );
      if (response.statusCode == 200) {
        var newData = UserDataModel.fromJson(response.data);

        return newData;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
