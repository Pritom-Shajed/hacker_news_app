import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class GlobalAppBar {
  static SliderAppBar common ({String text = '', Color? color}) => SliderAppBar(title: Text(text), drawerIconColor: AppColors.white, appBarColor: AppColors.secondaryDarkAppColor,);
}
