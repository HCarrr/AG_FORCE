import 'dart:async';
import 'package:get/get.dart';

class QRCodeController extends GetxController {
  RxString qrData = '1234567890'.obs;
  Timer? qrCodeTimer;

  @override
  void onInit() {
    super.onInit();

    qrCodeTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      String newData = generateNewQRData();

      qrData.value = newData;
    });
  }

  @override
  void onClose() {
    qrCodeTimer?.cancel();
    // countdownTimer?.cancel();
    super.onClose();
  }

  String generateNewQRData() {
    return 'NewQRData${DateTime.now().millisecondsSinceEpoch}';
  }



}
