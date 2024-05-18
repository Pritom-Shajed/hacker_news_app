import 'package:get/get.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsController extends GetxController {

  late WebViewController webViewController;

  final dynamic news = Get.arguments;

  final _isLoading = false.obs;

  set isLoading (value) => _isLoading.value = value;
  bool get isLoading  => _isLoading.value;

  @override
  void onInit() {
    isLoading = true;
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.secondaryDarkAppColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            isLoading = false;
          },
        ),
      )
      ..loadRequest(Uri.parse(news is NewsModel ? news.url! : news));
    super.onInit();
  }

  @override
  void onClose() {
    webViewController.clearCache();
    super.onClose();
  }
}