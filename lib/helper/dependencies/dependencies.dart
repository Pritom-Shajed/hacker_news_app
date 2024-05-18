import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/helper/helper.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/storage/storage.dart';

Future<void> init () async{
  //Api
  Get.lazyPut(() => ApiClient(appBaseUrl: Environment.baseApiUrl), fenix: true);

  //Storage
  Get.lazyPut(() => StorageRepository(sharedPreferences:  Get.find()), fenix: true);
  Get.lazyPut(() => StorageController(storageRepo:  Get.find()), fenix: true);

  //Home
  Get.put<HomeRepository>(HomeRepository(apiClient: Get.find()), permanent: true);
  Get.put<HomeController>(HomeController(homeRepo: Get.find()), permanent: true);


}