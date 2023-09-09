import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:agforce_kehadiran/constants/assets_constant.dart';

import '../../utilities/colors.dart';
import '../../utilities/typhography.dart';

class ButtonPrimary extends StatefulWidget {
  const ButtonPrimary(
      {Key? key,
        required this.textButton,
        required this.onTap,
        this.withArrow = true,
        this.textStyle = TStyle.button1,
        this.paddingVertical = 18,
        this.paddingHorizontal = 16,
        this.isActive = true,
        this.iconLeft = "",
        this.textColor = kColorPureWhite,
        this.color = kColorPrimary})
      : super(key: key);

  final Color color;
  final TextStyle textStyle;
  final Color textColor;
  final String textButton;
  final VoidCallback onTap;
  final bool withArrow;
  final double paddingVertical, paddingHorizontal;
  final bool isActive;
  final String iconLeft;

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.isActive ? widget.color : kColorLightBlue,
          borderRadius: BorderRadius.circular(50)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (!widget.isActive) {
              return;
            }
            FocusScope.of(context).unfocus();
            widget.onTap();
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal, vertical: widget.paddingVertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.iconLeft == ""
                    ? const SizedBox()
                    : Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      widget.iconLeft,
                      width: Get.width * 0.056,
                    )),
                Text(
                  widget.textButton,
                  style: widget.textStyle.copyWith(color: widget.textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
