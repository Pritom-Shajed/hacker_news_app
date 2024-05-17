import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:loader_overlay/loader_overlay.dart';

abstract class AppLoaders {


  static Widget loaderWithText ({Widget? loader}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loader ?? AppLoaders.spinningLines(),
        8.verticalSpace,
        AppTexts.typeWriterText(text: Strings.appName)
      ],
    );
  }

  static Widget spinningLines ({double? size, Color? color}){
    return SpinKitThreeBounce(
      color:  color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }

  static Widget pulse ({double? size, Color? color}){
    return SpinKitPulse(
      color:  color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }

  static Widget wave ({double? size, Color? color}){
    return SpinKitWave(
      color:  color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }
}