import 'package:get/get.dart';
import 'package:hacker_news_app/data/api/api_client.dart';
import 'package:hacker_news_app/modules/home/repository/home_repository.dart';

class HomeController extends GetxController {
 final HomeRepository homeRepo;

 HomeController({required this.homeRepo});


}