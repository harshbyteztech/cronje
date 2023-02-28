import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';
import 'app_dimens.dart';

class TextStyleWidget {
  static TextStyle regularTextStyle(
          {fontSize = AppDimens.default_font,
          color = mainColor,
          height = 1.0}) =>
      GoogleFonts.getFont(
        'Libre Baskerville',
        fontSize: fontSize,
        color: color,
        height: height,
        fontWeight: FontWeight.w400,
      );

  static TextStyle mediumTextStyle(
      {fontSize = AppDimens.default_font,
        color = mainColor,
        height = 1.0}) =>
      GoogleFonts.getFont(
        'Libre Baskerville',
        fontSize: fontSize,
        color: color,
        height: height,
        fontWeight: FontWeight.w600,
      );

  static TextStyle boldTextStyle(
      {fontSize = AppDimens.default_font,
        color = mainColor,
        height = 1.0}) =>
      GoogleFonts.getFont(
        'Libre Baskerville',
        fontSize: fontSize,
        color: color,
        height: height,
        fontWeight: FontWeight.w700,
      );

  static TextStyle regularTextStyle1(
      {fontSize = AppDimens.default_font,
        color = mainColor,
        height = 1.0}) =>
      GoogleFonts.getFont(
        'Lexend',
        fontSize: fontSize,
        color: color,
        height: height,
        fontWeight: FontWeight.w400,
      );

  static TextStyle mediumTextStyle1(
      {fontSize = AppDimens.default_font,
        color = mainColor,
        fontWeight = FontWeight.w600,
        height = 1.0}) =>
      GoogleFonts.getFont(
        'Lexend',
        fontSize: fontSize,
        color: color,
        height: height,
        fontWeight: fontWeight,
      );

  static TextStyle boldTextStyle1(
      {fontSize = AppDimens.default_font,
        color = mainColor,
        height = 1.0}) =>
      GoogleFonts.getFont(
        'Lexend',
        fontSize: fontSize,
        color: color,
        height: height,
        fontWeight: FontWeight.w700,
      );
}
