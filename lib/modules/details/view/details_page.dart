import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/details/details.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsDetailsController>();

    return Scaffold(
      appBar: GlobalAppBar.common(onTapBack: () async{
        if (await controller.webViewController.canGoBack()) {
          controller.webViewController.goBack();
        } else {
          Get.back();
        }
      }),
      body: WillPopScope(
        onWillPop: () async {
          if (await controller.webViewController.canGoBack()) {
            controller.webViewController.goBack();
            return false; // Prevent the default back action
          } else {
            return true; // Allow the default back action
          }
        },
        child: Column(
          children: [

            controller.news is NewsModel ? NewsGlobalWidgets.newsHeader(title: controller.news.title, score: controller.news.score, author: controller.news.by, time: controller.news.time) : const SizedBox.shrink(),

            controller.news is NewsModel ?  12.verticalSpace : const SizedBox.shrink(),

            Expanded(
              child: Obx(
                () => controller.isLoading
                    ? AppLoaders.loaderWithText()
                    : WebViewWidget(controller: controller.webViewController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
