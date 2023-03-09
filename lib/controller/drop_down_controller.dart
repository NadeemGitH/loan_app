import 'package:get/get.dart';

class DropDownController extends GetxController {
  var isPasswordVisible = true.obs;
  var selectedGender = RxString('');
  var wallet = RxString('');
  var code = RxString('');
  var relationShip = RxString('');
  var religious = RxString('');
  var employeeIndex = RxString('');

  void selectGender(String gender) {
    selectedGender.value = gender;
    update();
    Get.back();
  }

  void selectWallet(String selectedWallet) {
    wallet.value = selectedWallet;
    update();
    Get.back();
  }
  void selectCode(String selectedCode) {
    code.value = selectedCode;
    update();
    Get.back();
  }
  void selectRelationShip(String relation) {
    relationShip.value = relation;
    update();
    Get.back();
  }
  void selectReligious(String religion) {
    religious.value = religion;
    update();
    Get.back();
  }
  void selectIndex(String index) {
    employeeIndex.value = index;
    update();
    Get.back();
  }
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }
}
