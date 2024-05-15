import 'package:flutter/material.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class GlobalAppBar {
  static PreferredSizeWidget common ({required String text, Color? color}) => AppBar(title: Text(text), backgroundColor: color ?? AppColors.primaryColor, centerTitle: true,);
}
