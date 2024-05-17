import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/news_details/controller/news_details_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key});



  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsDetailsController>();

    return Scaffold(
      appBar: GlobalAppBar.common(),
      body: Obx(
        () => controller.isLoading
            ? AppLoaders.loaderWithText()
            : WebViewWidget(controller: controller.webViewController),
      ),
    );
  }
}
