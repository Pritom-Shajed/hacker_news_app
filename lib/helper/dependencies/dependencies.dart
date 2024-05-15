import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/helper/helper.dart';

Future<void> init () async{
  Get.lazyPut(() => ApiClient(appBaseUrl: Environment.baseApiUrl, ), fenix: true);
}