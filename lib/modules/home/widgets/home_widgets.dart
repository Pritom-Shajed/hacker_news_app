import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomeWidgets {
  HomeWidgets._();

  static PreferredSizeWidget appBar ({String text = '', Color? color, VoidCallback? onTapDrawer, Key? drawerKey}) => AppBar(title: Text(text), leading: AppButtons.iconButton(key: drawerKey, icon: Icons.menu, onTap: onTapDrawer), backgroundColor: AppColors.darkScaffoldBackgroundColor,);

  static Widget greetings ({required String appName}){
    return RichText(text: TextSpan(text: 'Welcome to\n', style: TextStyle(color: AppColors.baseFontColor, fontWeight: FontWeight.bold, fontFamily: AppFonts.mulishRegular, fontSize: Dimensions.fontSize16), children: [
      TextSpan(text: '$appName!', style: TextStyle(color: AppColors.baseFontColor, fontFamily: AppFonts.mulishRegular, fontSize: Dimensions.fontSize28, fontWeight: FontWeight.bold),)
    ]));
  }

  static Widget slider ({required GlobalKey<ScaffoldState> key}){
    final controller = Get.find<HomeController>();
    return Container(
      padding: REdgeInsets.only(top: 80, left: 10, right: 10, bottom: 20),
      color: AppColors.darkScaffoldBackgroundColor,
      width: Get.width *0.6,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.sidebarCharacter, size: 130.h),
          30.verticalSpace,
          Obx(() => _sliderItem(title: Strings.topNews, isTapped: controller.topNewsTapped, onTap: (){
            controller.sliderBtnTap(isTopNewsTapped: true);
            if(key.currentState!.isDrawerOpen){
              key.currentState!.closeDrawer();
            }
            if(!controller.isLoadingTopNews){
              if(controller.topNews.isEmpty){
                controller.fetchNews(isTopNews: true);
              }
            }
          }),),
        16.verticalSpace,
        Obx(() =>    _sliderItem(title: Strings.latestNews, isTapped: controller.latestNewsTapped, onTap: (){
          controller.sliderBtnTap(isTopNewsTapped: false);
                if(key.currentState!.isDrawerOpen){
                  key.currentState!.closeDrawer();
                }
                if(!controller.isLoadingLatestNews){
                  if(controller.latestNews.isEmpty){
                    controller.fetchNews(isTopNews: false);
                  }
                }
              }),)

        ],
      ),
    );
  }
  
  static Widget newsTile (NewsModel news, {Key? newsKey, Key? commentsKey, required bool isTopNews, VoidCallback? onTapComments, VoidCallback? onTapNews}){
    return GestureDetector(
      key: newsKey,
      onTap: onTapNews,
      child: Stack(
        children: [
          //Placeholder
          Container(
            width: double.maxFinite,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius12),
              image: DecorationImage(image: AssetImage(AppJpgIcons.newsPlaceholder), fit: BoxFit.cover,  colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // Adjust the opacity as needed
                BlendMode.darken,
              ),),

            ),
          ),

          Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: REdgeInsets.all(6),
                margin: REdgeInsets.all(6),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius4),
                color: AppColors.primaryColor,
              ), child: AppTexts.smallText(text: isTopNews ? Strings.topNews : Strings.latestNews),)),

          //News
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

              //News Details
              Expanded(
                child: NewsGlobalWidgets.newsHeader(title: news.title, score: news.score, author: news.by, time: news.time),
              ),

              6.horizontalSpace,

              //Comment
              GestureDetector(
                key: commentsKey,
                onTap: onTapComments,
                child: Container(
                  margin: REdgeInsets.all(6),
                  padding: REdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius4),
                    color: AppColors.baseColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.comment, color: Colors.white,),
                      AppTexts.mediumText(text: '${news.kids?.length ?? 0}')
                    ],
                  ),
                ),
              )
                        ],
                      )),
        ],
      ),
    );
  }

  static Widget newsTileSkeleton ()=>AppSkeletons.skeletonContainer(height: 100.h);
}

Widget _sliderItem ({required String title, required bool isTapped, VoidCallback? onTap}){
  return Container(
    decoration: BoxDecoration(
      color: isTapped
          ? AppColors.primaryColor.withOpacity(0.2)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(Dimensions.radius8),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Dimensions.radius8),
        child: Container(
          margin: EdgeInsets.only(top: Dimensions.paddingVertical4),
          child: Row(
            children: [
              Container(
                width: 4.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: isTapped ? AppColors.primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius8),
                        bottomRight: Radius.circular(Dimensions.radius8))),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingVertical10,
                      horizontal: Dimensions.paddingHorizontal14),
                  child: Row(
                    children: [
                      AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.news, size: 24.h),
                      10.horizontalSpace,
                      Expanded(
                        child: AppTexts.smallText(text: title),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}