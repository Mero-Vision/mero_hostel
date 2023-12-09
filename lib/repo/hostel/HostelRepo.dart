import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/repo/apis/api.dart';

class HostelRepo {
  Api _api = Api();

  Future<HostelModel> getAllHostel() async {
    try {
      final response = await _api.sendRequest.get('/hostels');
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

  Future<HostelModel> getHostel(hostelType) async {
    try {
      final response = await _api.sendRequest
          .get('/hostels?hostel_type=$hostelType%20hostel');
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
}
