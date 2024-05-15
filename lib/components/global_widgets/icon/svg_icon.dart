import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  const SvgIcon({super.key, this.size, this.color, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath, width: size, height: size, color: color,);
  }
}