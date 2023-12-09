import 'package:get/get.dart';
import 'package:mero_hostel/models/hostelModel.dart';
import 'package:mero_hostel/repo/hostel/HostelRepo.dart';

class HostelController extends GetxController {
  final RxList<Datum> hostels = <Datum>[].obs;
  final RxList<Datum> boysHostels = <Datum>[].obs;
  final RxList<Datum> girlsHostels = <Datum>[].obs;

  void getAllHostel() async {
    HostelModel? data = await HostelRepo().getAllHostel();
    hostels.assignAll(data.data ?? []);
  }

  void getBoysHostel() async {
    HostelModel? data1 = await HostelRepo().getHostel('Boys');
    boysHostels.assignAll(data1.data ?? []);
  }

  void getGirlsHostel() async {
    HostelModel? data2 = await HostelRepo().getHostel('Girls');
    girlsHostels.assignAll(data2.data ?? []);
  }
}
