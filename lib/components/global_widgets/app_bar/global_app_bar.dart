import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class GlobalAppBar {
  static PreferredSizeWidget common({String? text, Color? color, VoidCallback? onTapBack}) => AppBar(
    leading: AppButtons.iconButton(icon: Icons.arrow_back_ios, onTap: onTapBack ?? ()=> Get.back()),
        title: text != null ? Text(text, style: TextStyle(fontSize: Dimensions.fontSize16),) : null,
        iconTheme: IconThemeData(
          color: AppColors.white, //change your color here
        ),
        backgroundColor: AppColors.secondaryDarkAppColor,
      );
}
