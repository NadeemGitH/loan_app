import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';

import 'package:get/get.dart';

import '../../../../../controller/drop_down_controller.dart';
import '../../../../../widgets/bottom_sheet.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../Employee_information/employee_info_Screen.dart';

class PersonalInformationScreenTwo extends StatelessWidget {
  PersonalInformationScreenTwo({Key? key}) : super(key: key);
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _nearesController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  final DropDownController dropDownController = Get.put(DropDownController());

  @override
  Widget build(BuildContext context) {
    DropDownController dropDownController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Personal Information',
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 0.5)),
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            dropDownController.relationShip.isEmpty
                                ? "Single"
                                : "${dropDownController.relationShip}",
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
                                  "Single",
                                  "Married"
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
                                      dropDownController.relationShip,
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
                  height: Get.width * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _educationController,
                  hint: 'Education Level',
                ),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Address!';
                    }
                    return null;
                  },
                  controller: _addressController,
                  hint: 'Current Residential Address',
                ),
                SizedBox(
                  height: Get.height * 0.045,
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
                            dropDownController.religious.isEmpty
                                ? "Christian"
                                : "${dropDownController.religious}",
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
                                  "Christian",
                                  "Muslim"
                                ];
                                return CustomBottomSheet(
                                  height: 140,
                                  title: Text(''),
                                  items: items,
                                  onItemSelected: dropDownController.religious,
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
                  height: Get.width * 0.05,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter City!';
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
                  controller: _areaController,
                  hint: 'Area',
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
                  controller: _nearesController,
                  hint: 'Nearest',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(height: Get.height * 0.03),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _educationController.text.trim();
                          _addressController.text.trim();
                          _cityController.text.trim();
                          _areaController.text.trim();
                          _nearesController.text.trim();
                          Get.to(() => EmployeeInfroScreen());
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
