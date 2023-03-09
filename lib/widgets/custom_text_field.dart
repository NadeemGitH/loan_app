import 'package:flutter/material.dart';

// Optional import for GetX
import 'package:get/get.dart' show VoidCallback;

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final Function(String?)? onDropdownChanged;
  final BoxBorder? border;
  final InputDecoration? inputDecoration;
  final String? Function(String? value)? validate;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged; // New optional parameter

  CustomTextField({
    Key? key,
    this.hint,
    this.validate,
    required this.controller,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.dropdownItems,
    this.dropdownValue,
    this.onDropdownChanged,
    this.border,
    this.inputDecoration,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged, // Add the new parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: inputDecoration ??
            InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                icon: suffixIcon!,
                onPressed: onSuffixIconPressed,
              )
                  : null,
            ),
        keyboardType: keyboardType,
        onChanged: onChanged != null // Check if onChanged is not null
            ? (value) {
          onChanged!(value); // Call onChanged if it's not null
        }
            : null,
        validator: validate,
      ),
    );
  }
}

