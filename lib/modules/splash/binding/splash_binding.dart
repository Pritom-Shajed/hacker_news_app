import 'package:get/get.dart';
import 'package:hacker_news_app/modules/splash/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }

}