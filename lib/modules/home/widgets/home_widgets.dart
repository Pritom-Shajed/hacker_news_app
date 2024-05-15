import 'package:flutter/material.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class HomeWidgets {
  static Widget tabBar ({required String tabText1, required String tabText2, required TabController controller}) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingHorizontal16),
      child: TabBar(
        indicatorColor: AppColors.primaryColor,
        labelStyle: TextStyle(color: AppColors.baseFontColor, fontFamily: AppFonts.mulishRegular, fontSize: Dimensions.fontSize16),
        controller: controller,
        tabs:  [
          Tab(text: tabText1),
          Tab(text: tabText2),
        ],
      ),
    );
  }
}