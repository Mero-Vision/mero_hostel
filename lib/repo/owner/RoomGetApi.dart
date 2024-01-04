import 'package:dio/dio.dart';
import 'package:mero_hostel/models/owner/rooms/getAssignRoomModel.dart';
import 'package:mero_hostel/models/owner/rooms/roomModel.dart';

import 'package:mero_hostel/repo/apis/AuthApi.dart';
import 'package:mero_hostel/repo/apis/api.dart';

class RoomGetApi {
  final AuthApi _authApi = AuthApi();
  final Api _api = Api();
  Future<RoomsModel?> getRoomRequest(String? accessToken) async {
    try {
      var response = await _authApi.sendRequest.get(
        '/admin/rooms',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = RoomsModel.fromJson(response.data);

        return data;
      } else {
        throw Exception(
            'Received unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load hostels: $e');
    }
  }

  Future<RoomsModel> getSingleRoomData(String? hostelId) async {
    var headers = {'Accept': 'application/json'};

    var response = await _api.sendRequest.get(
      '/hostel-rooms?hostel_id=$hostelId',
      options: Options(
        // method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      var data = RoomsModel.fromJson(response.data);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<GetAssignRoomModel> getRoomToAssign(
      int hostelId, String? accessToken) async {
    //  var headers = {'Accept': 'application/json'};

    var response = await _authApi.sendRequest.get(
      '/admin/user-rooms?hostel_id=$hostelId',
      options: Options(
        headers: {
          'Content-Type': 'application/json', // Set your content type as needed
          'Authorization': 'Bearer $accessToken', // Add your API key here
        },
      ),
    );

    if (response.statusCode == 200) {
      var data = GetAssignRoomModel.fromJson(response.data);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }


}
