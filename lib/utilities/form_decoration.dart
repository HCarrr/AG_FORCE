
import 'package:agforce_kehadiran/utilities/typhography.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration kDecorationForm = InputDecoration(
  contentPadding: const EdgeInsets.only(left: 16, right: 16),
  filled: true,
  fillColor: kColorLightGrey,
  hintStyle: TStyle.subtitle2.copyWith(color: kColorMediumGrey),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(
      color: kColorRed,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:  BorderSide(
      color: kColorRed,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
  // errorStyle: TStyle.body.copyWith(color: kColorRed100),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
);

BoxDecoration kBoxShadow = BoxDecoration(
    color: kColorPureWhite,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
          color: kColorPureBlack.withOpacity(0.1),
          offset: const Offset(0,2),
          blurRadius: 4
      )
    ]
);