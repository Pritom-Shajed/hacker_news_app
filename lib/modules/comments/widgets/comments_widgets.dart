import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/routes/routes.dart';

import '../../../utils/constants/constants.dart';

class CommentsWidgets {
  CommentsWidgets._();

  static Widget commentTile ({required int time, required String author, required String comment}){
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius12),
        color: AppColors.baseColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTexts.verySmallText(text: '$author | ${TimeFormatter.differenceInHours(timestamp: time)} hours ago'),

          SizedBox(width: Get.width * 0.4, child: Divider(height: 16.h,color: AppColors.darkGray,),),

          HtmlWidget(
            comment,
            renderMode: RenderMode.column,
            onTapUrl: (url){
              Get.toNamed(Routes.DETAILS, arguments: url);
              return false;
            },
            textStyle: TextStyle(fontSize: Dimensions.fontSize12),
          ),
        ],
      ),
    );
  }
}