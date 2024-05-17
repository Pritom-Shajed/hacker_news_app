import 'package:flutter/material.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class AppSkeletons {
  AppSkeletons._();

  static Widget skeletonCircle(
      {Color? baseColor, Color? highlightColor, double? radius}) =>
      Shimmer.fromColors(
          baseColor: baseColor ?? AppColors.skeletonColor1,
          highlightColor: highlightColor ?? AppColors.skeletonColor2,
          child: CircleAvatar(
            radius: radius,
          ));

  static Widget skeletonContainer(
      { double? height,
        double? width,
        Color? baseColor,
        Color? highlightColor,
        double? radius}) =>
      Shimmer.fromColors(
          baseColor: baseColor ?? AppColors.skeletonColor1,
          highlightColor: highlightColor ?? AppColors.skeletonColor2,
          child: Container(
            height: height,
            width: width ?? double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.skeletonColor1,
              borderRadius: BorderRadius.circular(radius ?? Dimensions.radius8),
            ),
          ));
}