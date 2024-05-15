import 'dart:developer';
import 'package:get/get.dart';
import 'package:hacker_news_app/modules/home/controller/home_controller.dart';
import 'package:hacker_news_app/routes/routes.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    super.onReady();
     Get.find<HomeController>().fetchTopNews().then((topNewsResponse) {
       if(topNewsResponse.isSuccess){
         Get.find<HomeController>().fetchLatestNews().then((latestNewsResponse) {
           if(latestNewsResponse.isSuccess){
             Get.offAllNamed(Routes.HOME);
           } else {
             log('latest news error: ${latestNewsResponse.message}');
           }
         });
       } else {
         log('top news error: ${topNewsResponse.message}');
       }
     });
  }
}