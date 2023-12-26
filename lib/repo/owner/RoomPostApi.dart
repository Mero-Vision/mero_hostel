import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mero_hostel/models/owner/rooms/createRoomModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class RoomPostApi {
  final AuthApi _api = AuthApi();
  Future<CreateRoomsModel?> createRoomRequest(
      String roomNumber,
      String roomType,
      String capacity,
      String availability,
      String price,
      String features,
      String hostelId,
      File? roomImage,
      String? accessToken) async {
    var data = FormData.fromMap({
      'room_image': [
        await MultipartFile.fromFile(roomImage?.path ?? '',
            filename: roomImage?.path)
      ],
      'room_number': roomNumber,
      'room_type': roomType,
      'capacity': capacity,
      'availability': availability,
      'price': price,
      'features': features,
      'hostel_id': hostelId
    });

    try {
      var response = await _api.sendRequest.post(
        '/admin/rooms',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
        data: data,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = CreateRoomsModel.fromJson(response.data);

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
