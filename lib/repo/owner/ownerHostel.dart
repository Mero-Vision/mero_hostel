import 'package:dio/dio.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/models/owner/BookingRequestModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class OwnerHostelApi {
  AuthApi _api = AuthApi();
  Future<HostelModel?> getOwnerHostel(int userId, String accessToken) async {
    try {
      final response =
          await _api.sendRequest.get('/admin/hostels?user_id=$userId',
              options: Options(
                headers: {
                  'Content-Type':
                      'multipart/form-data', // Set your content type as needed
                  'Authorization':
                      'Bearer $accessToken', // Add your API key here
                },
              ));
      if (response.statusCode == 200) {
        HostelModel datas = HostelModel.fromJson(response.data);

        return datas;
      } else {
        throw Exception('Something went wrong re');
      }
    } catch (e) {
      throw Exception('Failed to load hostels');
    }
  }

  Future<BookingRequestModel?> getBookingReq(
      int userId, String accessToken) async {
    try {
      final response =
          await _api.sendRequest.get('/admin/hostel-booking?user_id=$userId',
              options: Options(
                headers: {
                  'Content-Type':
                      'multipart/form-data', // Set your content type as needed
                  'Authorization':
                      'Bearer $accessToken', // Add your API key here
                },
              ));
      if (response.statusCode == 200) {
        BookingRequestModel datas = BookingRequestModel.fromJson(response.data);

        return datas;
      } else {
        throw Exception('Something went wrong re');
      }
    } catch (e) {
      throw Exception('Failed to load hostels');
    }
  }
}
