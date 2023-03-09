import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/view/screens/dashboard/dash_board_screen.dart';
import 'package:waleed_project/view/screens/personal_info_screen/personal_info_screen.dart';
import 'package:waleed_project/widgets/custom_appbar.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/drop_down_controller.dart';
import '../../../widgets/custom_botton.dart';
import '../../../widgets/custom_snack_bar.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

  final TextEditingController _pinController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  bool _showButton = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
        showBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _loginFormKey,
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: Get.width * 0.75,
              child: Container(
                width: Get.width * 1.0,
                height: Get.height * 0.43,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.width * 0.13,
              left: Get.width * 0.1,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  width: Get.width * 0.78,
                  //height: Get.width * 1.0,
                  child: Column(
                    children: [
                      const SizedBox(height: 8,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: CustomTextField(
                          onChanged: (value) {
                            setState(() {
                              _phoneNumber = value ?? '';
                              _showButton = _phoneNumber.isNotEmpty;
                            });
                          },
                          keyboardType: TextInputType.numberWithOptions(),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Required!';
                            }else if(value!.length<10){
                              return'Number should be 10 degits';
                            }

                          },
                          controller: _phoneNumberController,
                          hint: 'Enter Phone Number',
                        ),
                      ),
                      const SizedBox(height: 13,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: CustomTextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter OTP!';
                            }
                            return null;
                          },
                          controller: _otpController,
                          hint: 'OTP Code',
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Visibility(
                        visible: _showButton,
                        child: Container(
                          color: Colors.deepPurple,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Do something when the button is pressed
                            },
                            child: Text('Get OTP',style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: GetBuilder<DropDownController>(builder: (controller){
                          return CustomTextField(
                            keyboardType: const TextInputType.numberWithOptions(),
                            obscureText: !controller.isPasswordVisible.value,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Pin Code here!';
                              }
                              return null;
                            },
                            suffixIcon:IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () => controller.togglePasswordVisibility(),
                            ),
                            controller: _pinController,
                            hint: 'Enter Pin Code',
                          );
                        }),
                      ),
                      const SizedBox(height: 10,),
                      const Text('forgot Password?'),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        text: 'login',
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            _phoneNumberController.text.trim();
                            _otpController.text.trim();
                            _pinController.text.trim();
                            Get.to(() => DashboardScreen(pageIndex: 0));
                          }
                        },
                      ),
                      const SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.width * 1.25,
              left: Get.width * 0.1,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  width: Get.width * 0.79,
                  height: Get.height * 0.28,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.15),
                    child: Row(
                      children: const [
                        Text(
                          '  Dont have an account yet?',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          '  SignUp',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
