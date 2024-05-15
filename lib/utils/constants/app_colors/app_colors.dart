import 'package:flutter/material.dart';

abstract class AppColors {

  static Color baseColor = hexToColor('#1B1E23');
  static Color baseFontColor = hexToColor('#1B1E23');
  static Color primaryColor = Colors.red;
  static Color lightScaffoldBackgroundColor = const Color(0xFFFFFFFF);
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = Colors.red.withOpacity(0.5);
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = const Color(0xFFF6F6F6);
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color red =  Colors.red.shade300;

  static Color placeCodeColor = hexToColor('#8CBEB4');
  static Color districtColor = hexToColor('#B44641');
  static Color postCodeColor = hexToColor('#669DEF');

  static Color hintTextColor = hexToColor('#a8a8a8');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}