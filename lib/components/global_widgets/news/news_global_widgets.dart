import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class NewsGlobalWidgets {
  NewsGlobalWidgets._();

  static Widget newsHeader ({String? title, int? score, String? author, int? time,}){
    return Padding(
      padding: REdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.mediumText(text: title ?? '', maxLine: 3, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold, color: AppColors.baseFontColor),
          AppTexts.verySmallText(text: '${score != null ? '$score points' : ''} ${author != null ? 'by $author' : ''} | ${time != null ? '${TimeFormatter.differenceInHours(timestamp: time)} hours ago' : ''}')
        ],
      ),
    );
  }
}