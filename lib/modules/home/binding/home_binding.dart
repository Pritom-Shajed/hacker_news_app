import 'package:get/get.dart';
import 'package:hacker_news_app/modules/home/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepository(apiClient: Get.find()), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(homeRepo: Get.find()), fenix: true);
  }

}