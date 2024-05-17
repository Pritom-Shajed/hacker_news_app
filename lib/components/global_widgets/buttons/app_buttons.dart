import 'package:flutter/cupertino.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class AppButtons {
  AppButtons._();

  static Widget textButton ({VoidCallback? onTap, int? maxLines, TextOverflow? overflow, required bool isTappable, required String text, Color? color, FontWeight? fontWeight}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text, maxLines: maxLines ?? 3, overflow: overflow ?? TextOverflow.ellipsis, style: TextStyle(color: color ?? (isTappable ? AppColors.baseFontColor : AppColors.lightFontColor), fontSize: Dimensions.fontSize14, fontWeight: fontWeight ),),
    );
  }
}