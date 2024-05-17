import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/helper/helper.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconWidgets.lottieAssetIcon(iconPath: AppLottieIcons.loader, size: context.screenWidth * 0.5),
            16.verticalSpace,
            AppTexts.typeWriterText(text: Strings.appName, fontSize: Dimensions.fontSize16)
          ],
        ),
      ),
    );
  }
}