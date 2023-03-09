import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> dropdownList;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintTextStyle;

  const CustomDropdown({super.key,
    required this.hintText,
    required this.dropdownList,
    this.decoration,
    this.width,
    this.height,
    this.padding,
    this.hintTextStyle,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16),
      decoration: widget.decoration ??
          BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            widget.hintText,
            style: widget.hintTextStyle,
          ),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: widget.dropdownList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}





