import 'package:flutter/material.dart';

 class AppColors {

   AppColors._();

  static Color baseColor = hexToColor('#1B1E23');
  static Color baseFontColor = Colors.white;
  static Color lightFontColor = Colors.white.withOpacity(0.6);
  static Color primaryColor = Colors.red;
  static Color lightScaffoldBackgroundColor = const Color(0xFFFFFFFF);
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = Colors.red.withOpacity(0.5);
  static Color secondaryDarkAppColor = hexToColor('#2F2E2E');
  static Color lightGray = const Color(0xFFF6F6F6);
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);

  static Color skeletonColor1 = Colors.black54;
  static Color skeletonColor2 = Colors.black26;

}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}