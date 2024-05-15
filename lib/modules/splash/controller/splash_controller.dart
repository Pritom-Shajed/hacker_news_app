import 'package:get/get.dart';
import 'package:hacker_news_app/routes/routes.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.HOME);
  }
}