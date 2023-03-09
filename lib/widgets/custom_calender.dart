import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _dateController,
      hint: 'Select a date',
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_today,color: Colors.black,),
        onPressed: () {
          _selectDate(context);
        },
      ),
    );
  }
}
