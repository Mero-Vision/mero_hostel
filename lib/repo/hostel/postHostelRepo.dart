// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/models/owner/RequestBookingModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class PostHostelApi {
  final AuthApi _api = AuthApi();
  Future<Datum> postHostel(
      String hostelNameController,
      String hostelAddressController,
      String hostelPhoneController,
      String hostelEmailController,
      String hostelWebsiteController,
      String hostelTypeController,
      File hostelImageData,
      String accessToken) async {
    var data = FormData.fromMap({
      'hostel_image': [
        await MultipartFile.fromFile(hostelImageData.path,
            filename: hostelImageData.path)
      ],
      'hostel_name': hostelNameController,
      'address': hostelAddressController,
      'phone_number': hostelPhoneController,
      'email': hostelEmailController,
      'website': hostelWebsiteController,
      'hostel_type': hostelTypeController
    });

    try {
      var response = await _api.sendRequest.post(
        '/admin/hostels',
        options: Options(
          headers: {
            'Content-Type':
                'multipart/form-data', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
        data: data,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Datum data = Datum.fromJson(response.data);
        return data;
      } else {
        throw Exception(
            'Received unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load hostels: $e');
    }
  }

  Future<RequestBookingModel?> sendBookingReq(
      int hostelId, String accessToken) async {
    try {
      final response = await _api.sendRequest.post('/admin/hostel-booking',
          data: {
            'hostel_id': hostelId,
          },
          options: Options(
            headers: {
              'Content-Type':
                  'application/json', // Set your content type as needed
              'Authorization': 'Bearer $accessToken', // Add your API key here
            },
          ));

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = RequestBookingModel.fromJson(response.data);
        return data;
      }
      //
    } catch (e) {
      throw Exception('Failed to load hostels: $e');
    }
  }
}
