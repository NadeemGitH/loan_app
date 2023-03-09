import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/drop_down_controller.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_drop_down.dart';

class MobileWalletScreen extends StatefulWidget {
  MobileWalletScreen({Key? key}) : super(key: key);

  @override
  State<MobileWalletScreen> createState() => _MobileWalletScreenState();
}

class _MobileWalletScreenState extends State<MobileWalletScreen> {
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _walletNumberController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _nearestController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DropDownController walletController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Mobile Wallet',
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
                            walletController.wallet.isEmpty
                                ? "MTN"
                                : "${walletController.wallet}",
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
                              context: context,
                              builder: (BuildContext context) {
                                return CustomBottomSheet(
                                  height: 200,
                                  title: Text(''),
                                  items: const ["LTA", "BPL", "PSL"],
                                  onItemSelected: walletController.wallet,
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
                  controller: _holderNameController,
                  hint: 'Wallet Holder Name',
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
                  controller: _walletNumberController,
                  hint: 'Wallet Number',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Text(
                  'Please Set a 4 digit passcode to enter login into your account',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  controller: _areaController,
                  hint: 'Password Pin',
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
                  controller: _nearestController,
                  hint: 'Confirm Password Pin',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(height: Get.height * 0.01),
                SizedBox(
                  height: Get.height * 0.07,
                  width: double.maxFinite,
                  child: CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _holderNameController.text.trim();
                          _walletNumberController.text.trim();
                          _areaController.text.trim();
                          _nearestController.text.trim();
                        }
                        // Get.to(() => const EmployeeInfroScreen());
                      }),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
