import 'package:dio/dio.dart';
import 'package:mero_hostel/models/owner/rooms/roomModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class RoomGetApi {
  final AuthApi _api = AuthApi();
  Future<RoomsModel?> getRoomRequest(String? accessToken) async {
    try {
      var response = await _api.sendRequest.get(
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
}
