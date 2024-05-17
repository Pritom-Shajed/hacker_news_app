import 'package:get/get.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsController extends GetxController {

  late WebViewController webViewController;

  final _newsUrl = Get.arguments;

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
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            isLoading = false;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_newsUrl));
    super.onInit();
  }

  @override
  void onClose() {
    webViewController.clearCache();
    super.onClose();
  }
}