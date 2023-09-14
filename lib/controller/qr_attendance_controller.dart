import 'dart:async';
import 'package:get/get.dart';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:encrypt/encrypt.dart' as enc;

class QRCodeController extends GetxController {
  RxString qrData = ''.obs;
  Timer? qrCodeTimer;
  DateTime dateTime = DateTime.now();
  var resultQR = ''.obs;

  var publicKey = ''.obs;
  var privateKey = ''.obs;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
    encrypt();
    // data();
    Map<String, dynamic> arguments = Get.arguments;
    publicKey.value = arguments['publicKey'];
    privateKey.value = arguments['privateKey'];

    qrCodeTimer = Timer.periodic(Duration(seconds: 6), (timer) {
      String newData = generateNewQRData();
      encrypt();
      // data();
      qrData.value = resultQR.value;
    });
  }

  @override
  void onClose() {
    qrCodeTimer?.cancel();
    countdownTimer?.cancel();
    super.onClose();
  }

  RxInt countdown = 5.obs;
  Timer? countdownTimer;

  void startCountdown() {
    const oneSecond = Duration(seconds: 1);
    countdownTimer = Timer.periodic(oneSecond, (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        countdown.value = 5;
        startCountdown();
      }
    });
  }

  /*void data() {
    Map<String, dynamic> arguments = Get.arguments;
    if (arguments != null) {
      String publicKey = arguments['publicKey'];
      String privateKey = arguments['privateKey'];

      DateTime dateTime = DateTime.now();
      final plainText = dateTime.toString();
      final key = Key.fromUtf8('12346789123456789112345678912345');
      final iv = IV.fromLength(16);

      final encrypter = Encrypter(AES(key));
      final encrypted = encrypter.encrypt("$publicKey#$plainText#$privateKey#AGFORCEJAYAJAYA", iv: iv);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);

      print(decrypted);
      print(encrypted.base64.toString());
      resultQR.value = encrypted.base64.toString();
      print(resultQR.value*//* + "qwqwqwq"*//*);
    }
  }*/

  String generateRandomString(int length) {
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => charset.codeUnitAt(random.nextInt(charset.length))));
  }

  String generateNewQRData() {
    return generateRandomString(10);
  }



  void encrypt(){
    Map<String, dynamic> arguments = Get.arguments;
      String publicKey = arguments['publicKey'];
      String privateKey = arguments['privateKey'];

    var date = DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());
    final plainText = '${publicKey}#${date}#${privateKey}#AGFORCEJAYAJAYA';
    final key = enc.Key.fromUtf8('${publicKey}');
    final iv = enc.IV.fromUtf8("my16digitIvKey12");
    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    resultQR.value = encrypted.base64;
    print("test123 ${resultQR.value.toString()}");
    // return encrypted.base64;

  }
}
