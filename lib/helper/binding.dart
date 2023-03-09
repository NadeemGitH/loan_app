import 'package:get/get.dart';
import '../controller/drop_down_controller.dart';

class FruitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => DropDownController());
  }
}