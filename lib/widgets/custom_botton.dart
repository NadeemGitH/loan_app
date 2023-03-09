import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height; // Optional height parameter
  final double? width; // Optional width parameter
  final double? fontSize; // Optional font size parameter

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height * 0.065, // Use height parameter, or fallback to default
      width: width ?? Get.height * 0.32, // Use width parameter, or fallback to default
      child: MaterialButton(
        color: Colors.deepPurple,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 18.0, // Use fontSize parameter, or fallback to default
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
