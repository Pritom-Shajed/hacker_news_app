import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> addAppTargetsPage ({
  required GlobalKey drawerKey,
  required GlobalKey newsKey,
  required GlobalKey commentsKey,
}) {
  List<TargetFocus> targets = [];

  ///Drawer
  targets.add(TargetFocus(
      keyTarget: drawerKey,
      alignSkip: Alignment.topRight,
      radius: Dimensions.radius12,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller){
              return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTexts.mediumText(text: Strings.userTourTitle1, fontWeight: FontWeight.bold),
                    SizedBox(width: Get.width * 0.5, child: Divider(height: 16.h,color: AppColors.white,),),
                    AppTexts.largeText(text: Strings.userTourDes1),
                  ],
                ),
              );
            }
        )
      ]
  ));

  ///News
  targets.add(TargetFocus(
      keyTarget: newsKey,
      alignSkip: Alignment.topRight,
      radius: Dimensions.radius12,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller){
              return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTexts.mediumText(text: Strings.userTourTitle2, fontWeight: FontWeight.bold),
                    SizedBox(width: Get.width * 0.5, child: Divider(height: 16.h,color: AppColors.white,),),
                    AppTexts.largeText(text: Strings.userTourDes2),
                  ],
                ),
              );
            }
        )
      ]
  ));

  ///Comments
  targets.add(TargetFocus(
      keyTarget: commentsKey,
      alignSkip: Alignment.topRight,
      radius: Dimensions.radius12,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller){
              return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTexts.mediumText(text: Strings.userTourTitle3, fontWeight: FontWeight.bold),
                    SizedBox(width: Get.width * 0.5, child: Divider(height: 16.h,color: AppColors.white,),),
                    AppTexts.largeText(text: Strings.userTourDes3),
                  ],
                ),
              );
            }
        )
      ]
  ));


  return targets;

}