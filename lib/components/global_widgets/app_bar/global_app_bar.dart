import 'package:flutter/material.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class GlobalAppBar {
  static PreferredSizeWidget common({String? text, Color? color}) => AppBar(
        title: text != null ? Text(text, style: TextStyle(fontSize: Dimensions.fontSize16),) : null,
        iconTheme: IconThemeData(
          color: AppColors.white, //change your color here
        ),
        backgroundColor: AppColors.secondaryDarkAppColor,
      );
}
