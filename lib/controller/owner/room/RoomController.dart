import 'dart:io';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/models/owner/rooms/createRoomModel.dart';
import 'package:mero_hostel/models/owner/rooms/getAssignRoomModel.dart';
import 'package:mero_hostel/models/owner/rooms/roomModel.dart';
import 'package:mero_hostel/repo/owner/RoomGetApi.dart';
import 'package:mero_hostel/repo/owner/RoomPostApi.dart';
import 'package:mero_hostel/repo/owner/approveUserRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomController extends GetxController {
  RxBool isLoaded = false.obs;
  //
  CreateRoomsModel? createRoomsModel;
  RoomsModel? roomsModel;
  GetAssignRoomModel? getAssignRoomModel;
  //
  final RoomPostApi _roomPostApi = RoomPostApi();
  final RoomGetApi _roomGetApi = RoomGetApi();
  Future<void> createSingleRoom(
    String roomNumber,
    String roomType,
    String capacity,
    String availability,
    String price,
    String features,
    String hostelId,
    File? roomImage,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("AccessToken");

    try {
      var response = await _roomPostApi.createRoomRequest(
          roomNumber,
          roomType,
          capacity,
          availability,
          price,
          features,
          hostelId,
          roomImage,
          accessToken);
      if (response != null) {
        Get.defaultDialog(
            title: 'Success!',
            content: MyText(text: response.message.toString(), size: 20));
        createRoomsModel = response;
        update();
      } else {
        Get.defaultDialog(
            title: 'Oops!',
            content: MyText(
                text: response?.message ?? 'something Went Wrong', size: 20));
      }
    } catch (e) {
      print(e);
    }
  }

  Future getAllRooms() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString('AccessToken');
    try {
      var response = await _roomGetApi.getRoomRequest(
        accessToken,
      );
      roomsModel = response;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future getSingleRoom(String? hostelId) async {
    var data = await _roomGetApi.getSingleRoomData(hostelId);
    roomsModel = data;
    update();
  }

  Future<bool> approveUser(int bookingId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('AccessToken');
    var response = await ApproveUserRepo().approveRequest(bookingId, token!);
    if (response.data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future getRoomToAssign(int hostelId) async {
    isLoaded.value = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString('AccessToken');
    try {
      var response = await _roomGetApi.getRoomToAssign(
        hostelId,
        accessToken,
      );
      getAssignRoomModel = response;
      update();
      isLoaded.value = true;
    } catch (e) {
      print(e);
    }
  }
}
