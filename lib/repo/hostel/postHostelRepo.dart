// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class PostHostelApi {
  final AuthApi _api = AuthApi();
  Future<HostelModel> postHostel(
      String hostelNameController,
      String hostelAddressController,
      String hostelPhoneController,
      String hostelEmailController,
      String hostelWebsiteController,
      String hostelTypeController,
      String hostelImageData,
      String accessToken) async {
    try {
      var response = await _api.sendRequest.post(
        '/admin/hostels',
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
        data: {
          "hostel_name": hostelNameController,
          "address": hostelAddressController,
          "phone_number": hostelPhoneController,
          "email": hostelEmailController,
          "website": hostelWebsiteController,
          "hostel_type": hostelTypeController,
          "hostel_images": hostelImageData,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        HostelModel data = HostelModel.fromJson(response.data);
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
