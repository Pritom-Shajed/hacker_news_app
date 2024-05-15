import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:loader_overlay/loader_overlay.dart';

abstract class AppLoaders {

  static showOverlayLoader (BuildContext context){
    context.loaderOverlay.show(
      widgetBuilder: (progress) {
        return _overlayLoader();
      },
    );
  }

  static hideOverlayLoader(BuildContext context) {
    context.loaderOverlay.hide();
  }

  static Widget spinningLines ({double? size, Color? color}){
    return SpinKitThreeBounce(
      color:  color ?? AppColors.primaryColor,
      size: size ?? 30.r,
    );
  }

  static Widget pulse ({double? size, Color? color}){
    return SpinKitPulse(
      color:  color ?? AppColors.primaryColor,
      size: size ?? 30.r,
    );
  }
}

Widget _overlayLoader (){
  return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.5,
          sigmaY: 4.5,
        ),
        child: Center(
          child: Container(
            width: 70.w,
            height: 70.w,
            padding: REdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius8),
            ),
            child: AppLoaders.pulse(),
          ),
        ),
      ));
}