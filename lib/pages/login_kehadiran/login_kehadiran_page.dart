import 'package:agforce_kehadiran/controller/login_kehadiran_controller.dart';
import 'package:agforce_kehadiran/pages/qr_attendance/qr_attendance_page.dart';
import 'package:agforce_kehadiran/routes/route_name.dart';
import 'package:agforce_kehadiran/utilities/colors.dart';
import 'package:agforce_kehadiran/widgets/buttons/button_primary.dart';
import 'package:agforce_kehadiran/widgets/container_info/container_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/form_decoration.dart';
import '../../utilities/typhography.dart';
import '../../widgets/appbar/appbar_default.dart';
import '../../widgets/buttons/button_action.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPureWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarDefault(
            titleWidget: Text(
              "Form Kehadiran",
              style: TStyle.headline3,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContainerInfo(
                          title: 'Silahkan lengkapi form terlebih dahulu di bawah ini untuk bisa menggunakan fitur kehadiran.',
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Unit Kerja',
                          style: TStyle.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.unitKerjaText.value,
                          decoration:
                          kDecorationForm.copyWith(
                              hintText: "Masukkan Unit Kerja"),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Public Key',
                          style: TStyle.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.publicKeyText.value,
                          decoration:
                          kDecorationForm.copyWith(
                              hintText: "Masukkan Public Key"),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Private Key',
                          style: TStyle.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: controller.privateKeyText.value,
                          decoration:
                          kDecorationForm.copyWith(
                              hintText: "Masukkan Private Key"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kColorPureWhite ,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: kColorPureBlack.withOpacity(0.1),
                  offset: const Offset(0, 0.5),
                  blurRadius: 10,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: ButtonPrimary(
                  textButton: 'Simpan',
                  onTap: (){
                    Get.toNamed(RouteName.qrAttendance);
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
