import 'package:dio/dio.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/repo/apis/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostHostelApi {
  Api _api;

  PostHostelApi() : _api = Api();

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('AccessToken');
  }

  Future<HostelModel> postHostel(
      String hostelNameController,
      String hostelAddressController,
      String hostelPhoneController,
      String hostelEmailController,
      String hostelWebsiteController,
      String hostelTypeController,
      String hostelImageData) async {
    try {
      String? accessToken = await getAccessToken();

      var response = await _api.sendRequest.post(
        '/admin/hostels',
        data: {
          "hostel_name": hostelNameController,
          "address": hostelAddressController,
          "phone_number": hostelPhoneController,
          "email": hostelEmailController,
          "website": hostelWebsiteController,
          "hostel_type": hostelTypeController,
          "hostel_images": hostelImageData,
        },
        options: Options(
          // Add the access token to the Authorization header
          headers: {'Authorization': 'Bearer $accessToken'},
          validateStatus: (status) {
            // Return true if you want to resolve the Future with the response even for 404 status code
            return status == null ||
                status >= 200 && status < 300 ||
                status == 404;
          },
        ),
      );

      if (response.statusCode == 201) {
        HostelModel datas = HostelModel.fromJson(response.data);
        return datas;
      } else {
        throw Exception(
            'Received unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load hostels: $e');
    }
  }
}
