import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/home/controller/home_controller.dart';
import 'package:hacker_news_app/routes/routes.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    super.onReady();
     Get.find<HomeController>().fetchTopNewsIds().then((topNewsResponse) {
       if(topNewsResponse.isSuccess){
         Get.find<HomeController>().fetchLatestNewsIds().then((latestNewsResponse) {
           if(latestNewsResponse.isSuccess){
             Get.offAllNamed(Routes.HOME);
           } else {
             AppToasts.shortToast(Strings.unknownError);
           }
         });
       } else {
         AppToasts.shortToast(Strings.unknownError);
       }
     });
  }
}