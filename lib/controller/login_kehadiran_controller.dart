import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var unitKerjaText = TextEditingController().obs;
  var publicKeyText = TextEditingController().obs;
  var privateKeyText = TextEditingController().obs;
  var listTextEditingRequired = <TextEditingController>[].obs;
  var isAllFormValid = false.obs;

  @override
  void onInit() async {
    super.onInit();

    listTextEditingRequired.addAll([unitKerjaText.value, publicKeyText.value, privateKeyText.value]);

    for (var controller in listTextEditingRequired) {
      controller.addListener(() {
        isAllFormValid.value = listTextEditingRequired.every((element) => element.text.isNotEmpty);
      });
    }

    print(unitKerjaText.toString() + "huha");

  }

  void saveData(String unitKerjaText, String publicKeyText, String privateKeyText) async {
    Get.arguments['unitKerja'] = unitKerjaText;
    Get.arguments['publicKey'] = publicKeyText;
    Get.arguments['privateKey'] = privateKeyText;
  }

  // void readData(){
  //   final box = GetStorage();
  //
  //   print(box.read('unitKerja').toString() + 'au');
  // }
  //
  // void deleteData(){
  //   final box = GetStorage();
  //
  //   print(box.remove('unitKerja').toString() + 'us');
  // }

}
