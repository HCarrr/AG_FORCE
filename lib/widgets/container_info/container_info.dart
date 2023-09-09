import 'package:agforce_kehadiran/constants/assets_constant.dart';
import 'package:agforce_kehadiran/utilities/colors.dart';
import 'package:agforce_kehadiran/utilities/typhography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '';

class ContainerInfo extends StatelessWidget {
  ContainerInfo({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColorLightBlue,
          ),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  child: SvgPicture.asset(AssetsConstant.icInfo)
              ),
               Expanded(
                child: Column(
                  children: [
                    Text(
                      "${title}",
                      style: TStyle.caption,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
