import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class AppTexts {

  static Widget typeWriterText ({required String text, Duration? speed, double? fontSize, Color? color, FontWeight? fontWeight}) =>  AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(text, speed: speed ?? const Duration(milliseconds: 100), textStyle: TextStyle(fontWeight: fontWeight, fontSize: fontSize ?? Dimensions.fontSize14,  color: color ?? AppColors.baseFontColor))]);

  static Widget largeText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize18, fontWeight: fontWeight),);
  }

  static Widget mediumText ({int? maxLine, TextOverflow? overflow, required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize14, fontWeight: fontWeight ),);
  }

  static Widget smallText ({required String text, TextAlign? textAlign, Color? color, FontWeight? fontWeight}){
    return Text(text, textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize12, fontWeight: fontWeight ),);
  }

  static Widget verySmallText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize10, fontWeight: fontWeight),);
  }
}