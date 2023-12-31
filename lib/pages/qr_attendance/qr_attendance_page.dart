import 'package:agforce_kehadiran/constants/assets_constant.dart';
import 'package:agforce_kehadiran/utilities/colors.dart';
import 'package:agforce_kehadiran/widgets/appbar/appbar_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

import '../../controller/qr_attendance_controller.dart';
import '../../utilities/typhography.dart';

class QRPage extends StatelessWidget {
  QRPage({super.key});

  QRCodeController controller = Get.put(QRCodeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPureWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarDefault(
                titleWidget: Text(
                    'Kehadiran',
                  style: TStyle.headline3,
                ),
              icBack: false,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  DateFormat('EEEE, d MMMM yyyy','id_ID').format(controller.dateTime),
                    style: TStyle.headline4.copyWith(color: kColorPrimary),
                  ),
                  const SizedBox(height: 21),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(AssetsConstant.bgQR),
                      Column(
                        children: [
                          Obx(() => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: QrImageView(
                                padding: EdgeInsets.all(20),
                                backgroundColor: kColorPureWhite,
                                data: controller.qrData.value,
                                version: QrVersions.auto,
                                size: 270.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AssetsConstant.icClock),
                              SizedBox(width: 6),
                              Obx(() => Text(
                                  'Reset dalam ${controller.countdown.value ~/ 60}:${(controller.countdown.value % 60).toString().padLeft(2, '0')}',
                                  style: TStyle.subtitle2.copyWith(color: kColorPrimary),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 49),
                  const Text(
                      'Scan kode QR di atas dengan aplikasi AG Force untuk check in dan check out kehadiran.',
                    style: TStyle.body1,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
