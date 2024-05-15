import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/helper/helper.dart';
import 'package:hacker_news_app/modules/home/home.dart';

Future<void> init () async{
  //Api
  Get.lazyPut(() => ApiClient(appBaseUrl: Environment.baseApiUrl), fenix: true);

  //Home
  Get.lazyPut<HomeRepository>(() => HomeRepository(apiClient: Get.find()), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(homeRepo: Get.find()), fenix: true);
}