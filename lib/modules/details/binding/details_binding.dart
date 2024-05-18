import 'package:get/get.dart';
import 'package:hacker_news_app/modules/details/details.dart';

class NewsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsDetailsController(), fenix: true);
  }

}