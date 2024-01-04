import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/models/user/search_model.dart';

import 'package:mero_hostel/repo/apis/api.dart';

class SearchRepository {
  Api api = Api();
  Future<List<String>> search(String query) async {
    // Simulate a search operation, replace this with your actual search logic
    await Future.delayed(Duration(seconds: 1));
    return List.generate(10, (index) => 'Result $index for "$query"');
  }

  Future<HostelModel> getSearchData(String search) async {
    try {
      var responce = await api.sendRequest.get('/hostels?search=$search');
      if (responce.statusCode == 200) {
        //   var data = SearchModel.fromJson(responce.data);
        var data = HostelModel.fromJson(responce.data);
        return data;
      } else {
        throw Exception(responce.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
