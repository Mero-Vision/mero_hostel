import 'package:dio/dio.dart';
import 'package:mero_hostel/models/owner/rooms/bookingApproveModel.dart';
import 'package:mero_hostel/repo/apis/AuthApi.dart';

class ApproveUserRepo {
  AuthApi _api = AuthApi();

  Future<BookingApproveModel> approveRequest(
      int bookingId, String accessToken) async {
    try {
      var data = {'_method': 'put'};
      var response = await _api.sendRequest.post(
        '/admin/hostel-booking/$bookingId',
        data: data,
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Set your content type as needed
            'Authorization': 'Bearer $accessToken', // Add your API key here
          },
        ),
      );

      if (response.statusCode == 200) {
        var newResponse = BookingApproveModel.fromJson(response.data);
        return newResponse;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
