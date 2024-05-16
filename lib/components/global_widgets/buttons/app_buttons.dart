import 'package:flutter/cupertino.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class AppButtons {
  AppButtons._();

  static Widget textButton ({VoidCallback? onTap, required String text, Color? color, FontWeight? fontWeight}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize14, fontWeight: fontWeight ),),
    );
  }
}