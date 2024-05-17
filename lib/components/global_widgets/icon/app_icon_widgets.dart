import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

abstract class AppIconWidgets {

  static Widget svgAssetIcon ({double? size, Color? color, required String iconPath}) => SvgPicture.asset(iconPath, width: size, height: size, color: color,);

  static Widget lottieAssetIcon ({double? size,required String iconPath}) => Lottie.asset(iconPath, width: size, height: size, fit: BoxFit.fill,);

}