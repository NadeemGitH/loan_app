import 'package:flutter/material.dart';
import 'package:waleed_project/view/screens/auth/login_screen.dart';
import 'package:get/get.dart';

import 'controller/drop_down_controller.dart';
import 'helper/binding.dart';

Future<void> main() async {
  Get.put(() => DropDownController());
  Get.lazyPut(() => DropDownController());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: FruitBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
