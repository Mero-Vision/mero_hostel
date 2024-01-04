import 'package:get/get.dart';
import 'package:mero_hostel/models/hostelModel.dart';
// import 'package:mero_hostel/models/user/search_model.dart';
import 'package:mero_hostel/repo/user/searchRepo.dart';

class SearchControllers extends GetxController {
  final RxString searchQuery = ''.obs;
  final RxBool isLoaded = false.obs;
  final RxList<Datum?> dataList = <Datum?>[].obs;

  void search(String search) async {
    isLoaded.value = false;
    dataList.value = [];
    if (search != '' || search.isNotEmpty) {
      var data = await SearchRepository().getSearchData(search);
      if (data.data!.isNotEmpty) {
        dataList.value = data.data!;
        isLoaded.value = true;
      }
    }
  }
}
