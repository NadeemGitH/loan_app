import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';

import 'package:get/get.dart';

import '../../../../../controller/drop_down_controller.dart';
import '../../../../../widgets/bottom_sheet.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../Emergency/emergency_contact.dart';

class EmployeeInfroScreen extends StatelessWidget {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _companyLocationController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _landMarkController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  EmployeeInfroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropDownController dropDownController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Employee Information',
        showBackButton: true,
      ),
      body: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _companyNameController,
                  hint: 'Company Name',
                ),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                CustomTextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _numberController,
                  hint: 'Phone Number',
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _companyLocationController,
                  hint: 'Company Location',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _cityController,
                  hint: 'City',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _landMarkController,
                  hint: 'Nearest LandMark',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 0.5)),
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            dropDownController.employeeIndex.isEmpty
                                ? "500-100"
                                : "${dropDownController.employeeIndex}",
                            style: const TextStyle(
                                fontSize: 18.0, color: Color(0xff747070)),
                          )),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                // <-- SEE HERE
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0),
                                ),
                              ),
                              constraints: BoxConstraints.loose(Size.fromHeight(
                                  MediaQuery.of(context).size.height *
                                      0.4)), // set max height to 40% of screen height
                              context: context,
                              builder: (BuildContext context) {
                                final List<String> items = [
                                  "300-200",
                                  "400-500"
                                ];
                                final double listItemHeight =
                                    50.0; // set the height of each ListTile
                                final double totalHeight =
                                    items.length * listItemHeight;
                                return CustomBottomSheet(
                                  height: 140,
                                  title: Text(''),
                                  items: items,
                                  onItemSelected:
                                      dropDownController.employeeIndex,
                                  shouldPop: true,
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _designationController,
                  hint: 'Designation Manager Signature',
                ),
                SizedBox(height: Get.height * 0.03),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _companyNameController.text.trim();
                          _numberController.text.trim();
                          _companyLocationController.text.trim();
                          _cityController.text.trim();
                          _landMarkController.text.trim();
                          _designationController.text.trim();
                          Get.to(() => EmergencyContactScreen());
                        }
                      }),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
