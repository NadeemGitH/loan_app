// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageController extends GetxController {
//   late final ImagePicker _picker = ImagePicker();
//   late final Rx<File?> image = Rx<File?>(null);
//
//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       image.value = File(pickedFile.path);
//     }
//   }
// }
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final ImageCropper cropper= ImageCropper();
  final Rx<File?> image = Rx<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final croppedFile = await cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        image.value = croppedFile as File?;
      }
    }
  }

  Future<CroppedFile?> cropImage(File imageFile) async {
    final croppedFile = await cropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    return croppedFile;
  }
}