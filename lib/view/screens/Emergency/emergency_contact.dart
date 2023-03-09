import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_appbar.dart';
import '../wallet/wallet_screen.dart';

class EmergencyContactScreen extends StatelessWidget {
  final TextEditingController _memberOneNameController =
      TextEditingController();
  final TextEditingController _memberOnePhoneController =
      TextEditingController();
  final TextEditingController _memberOneRelationController =
      TextEditingController();

  final TextEditingController _memberTwoNameController =
      TextEditingController();
  final TextEditingController _memberTwoPhoneController =
      TextEditingController();
  final TextEditingController _memberTwoRelationController =
      TextEditingController();

  final TextEditingController _workerNameController = TextEditingController();
  final TextEditingController _workerPhoneController = TextEditingController();
  final TextEditingController _workerRelationController =
      TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  EmergencyContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Emergency Contact',
        showBackButton: true,
      ),
      body: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                const Text(
                  'Family Member 1',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _memberOneNameController,
                  hint: 'Full Name',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _memberOnePhoneController,
                  hint: 'Phone Number',
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
                  controller: _memberOneRelationController,
                  hint: 'Relation(Sister,brother)',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Text(
                  'Family Member 2',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _memberTwoNameController,
                  hint: 'Full Name',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  keyboardType: TextInputType.numberWithOptions(),

                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _memberTwoPhoneController,
                  hint: 'Phone Number',
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
                  controller: _memberTwoRelationController,
                  hint: 'Relation(Sister,brother)',
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                const Text(
                  'Co-Worker',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomTextField(
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _workerNameController,
                  hint: 'Full Name',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  keyboardType: TextInputType.numberWithOptions(),

                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _workerPhoneController,
                  hint: 'Phone Number',
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
                  controller: _workerRelationController,
                  hint: 'Relation(Manager,supervisor)',
                ),
                SizedBox(height: Get.height * 0.03),
                SizedBox(
                  height: Get.height * 0.07,
                  width: double.maxFinite,
                  child: CustomButton(
                      text: 'Next',
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _memberOneNameController.text.trim();
                          _memberOnePhoneController.text.trim();
                          _memberOneRelationController.text.trim();
                          _memberTwoNameController.text.trim();
                          _memberTwoPhoneController.text.trim();
                          _memberTwoRelationController.text.trim();
                          _workerNameController.text.trim();
                          _workerPhoneController.text.trim();
                          _workerRelationController.text.trim();
                          Get.to(() => MobileWalletScreen());
                        }
                      }),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
