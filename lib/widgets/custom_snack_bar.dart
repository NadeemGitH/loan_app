import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar extends GetxController {
  void showSnackBar({required String message}) {
    Get.snackbar(
      'Title',
      message ?? '',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    );
  }
}