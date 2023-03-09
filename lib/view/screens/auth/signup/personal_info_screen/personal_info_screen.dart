import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waleed_project/view/screens/auth/signup/personal_info_screen/personal_info_two_screen.dart';
import 'package:waleed_project/view/screens/wallet/wallet_screen.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:waleed_project/widgets/custom_text_field.dart';
import '../../../../../controller/drop_down_controller.dart';
import '../../../../../controller/image_picke_controller.dart';
import '../../../../../widgets/bottom_sheet.dart';
import '../../../../../widgets/custom_appbar.dart';

import 'package:get/get.dart';

import '../../../../../widgets/custom_calender.dart';
import '../../../../../widgets/select_photo_options_screen.dart';

class PersonalInformationScreen extends StatefulWidget {
  PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _nameTwoController = TextEditingController();

  final TextEditingController _numberOneController = TextEditingController();

  final TextEditingController _numberTwoController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _numberThreeController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  final ImageController imageController = Get.put(ImageController());

  final DropDownController dropDownController = Get.put(DropDownController());

  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  child: GetBuilder<DropDownController>(
                      builder: (dropDownController) {
                    return Column(
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
                          controller: _nameController,
                          hint: 'Jujitsu',
                        ),
                        SizedBox(
                          height: Get.height * 0.045,
                        ),
                        CustomTextField(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Required!';
                            }
                            return null;
                          },
                          controller: _nameTwoController,
                          hint: 'Yorken',
                        ),
                        SizedBox(
                          height: Get.height * 0.045,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Phone Number!';
                            }
                            return null;
                          },
                          controller: _numberOneController,
                          hint: '02155677885',
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Phone Number!';
                            }
                            return null;
                          },
                          controller: _numberTwoController,
                          hint: '02155677885',
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        CustomTextField(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email!';
                            }
                            return null;
                          },
                          controller: _emailController,
                          hint: 'nadeem@gmail.com',
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        const MyDatePicker(),
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
                                    dropDownController.selectedGender.isEmpty
                                        ? "Male"
                                        : "${dropDownController.selectedGender}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff747070)),
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
                                      constraints: BoxConstraints.loose(
                                          Size.fromHeight(MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4)), // set max height to 40% of screen height
                                      context: context,
                                      builder: (BuildContext context) {
                                        final List<String> items = [
                                          "Male",
                                          "Female"
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
                                              dropDownController.selectedGender,
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.7),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    )),
                                height: Get.height * 0.078,
                                width: Get.width * 0.067,
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() => Text(
                                          dropDownController.code.isEmpty
                                              ? "GHA"
                                              : "${dropDownController.code}",
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Color(0xff747070)),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            shape: const RoundedRectangleBorder(
                                              // <-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(30.0),
                                              ),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(40),
                                                            topRight:
                                                                Radius.circular(
                                                                    40))),
                                                child: CustomBottomSheet(
                                                  height: 160,
                                                  title: const Text(''),
                                                  items: const ["RSA", "FRA"],
                                                  onItemSelected:
                                                      dropDownController.code,
                                                  shouldPop: true,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomTextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  // validate: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Enter Phone Number!';
                                  //   }
                                  //   return null;
                                  // },
                                  inputDecoration: const InputDecoration(
                                    hintText: '898889898989',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  controller: _numberThreeController),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '* Please add an image of your Ghana Card',
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(height: Get.height * 0.03),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: MaterialButton(
                                    height: 40,
                                    color: Colors.deepPurple,
                                    child:
                                        const Icon(Icons.camera_alt_outlined),
                                    onPressed: () async {
                                      _showSelectPhotoOptions(context);
                                      // await imageController
                                      //     .pickImage(ImageSource.camera);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          height: Get.height * 0.3,
                          width: double.maxFinite,
                          child: _image != null
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                )
                              : Center(child: Text('No image selected.')),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          height: Get.height * 0.07,
                          width: double.maxFinite,
                          child: CustomButton(
                              text: 'Next',
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  _nameTwoController.text.trim();
                                  _nameTwoController.text.trim();
                                  _numberOneController.text.trim();
                                  _nameTwoController.text.trim();
                                  _emailController.text.trim();
                                  _numberThreeController.text.trim();
                                  Get.to(() => PersonalInformationScreenTwo());
                                }
                              }),
                        ),
                        SizedBox(height: Get.height * 0.03),
                      ],
                    );
                  }))),
        ),
      ),
    );
  }
}
