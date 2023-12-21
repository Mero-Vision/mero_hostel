import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? file;
  String? ImageData;
  Future getImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print('imagePicked');
      var croppedImage = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 2));
      if (croppedImage != null) {
        file = File(croppedImage.path);

        List<int> imageBytes = await File(croppedImage.path).readAsBytes();

        // Convert the image bytes to a Base64-encoded string
        String base64Image = base64Encode(imageBytes);
        ImageData = base64Image;
      }

      update();
    }
  }
}
