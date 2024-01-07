import 'dart:io';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/dialoug_controller.dart';
import 'package:mero_hostel/models/owner/rooms/createRoomModel.dart';
import 'package:mero_hostel/models/owner/rooms/getAssignRoomModel.dart';
import 'package:mero_hostel/models/owner/rooms/roomModel.dart';
import 'package:mero_hostel/repo/owner/RoomGetApi.dart';
import 'package:mero_hostel/repo/owner/RoomPostApi.dart';
import 'package:mero_hostel/repo/owner/approveUserRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomController extends GetxController {
  RxBool isLoaded = false.obs;
  int numOfRooms = 0;
  RxBool isSelected = false.obs;
  bool isLoading = false;

  RxInt currentIndex = 1922.obs;
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
    isLoading = true;
    update();

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
        Get.back();
        Get.back();

        createRoomsModel = response;
        isLoading = false;
        update();
      } else {
        DialogController.showErrorSimpleDialog(
            'Oops!', response?.message ?? 'something Went Wrong');
        isLoading = false;
      }
    } catch (e) {
      DialogController.showErrorSimpleDialog('Oops!', 'something Went Wrong');
      isLoading = false;
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
    isLoaded.value = false;
    var data = await _roomGetApi.getSingleRoomData(hostelId);
    roomsModel = data;
    numOfRooms = data.data?.length ?? 0;
    isLoaded.value = true;
    update();
  }

  Future<bool> approveUser({required int bookingId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('AccessToken');

    var response = await ApproveUserRepo().approveRequest(bookingId, token!);
    if (response.data != null) {
      //    UserController().changeUserStatus(userEmail, "Hostel_User", token);

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

  Future roomToAssign({
    required int roomId,
    required int userId,
  }) async {
    isLoaded.value = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString('AccessToken');
    try {
      var response =
          await _roomPostApi.roomToAssign(roomId, userId, accessToken);
      print('userSuccessfully Assigned');
    } catch (e) {
      print(e);
    }
  }
}
