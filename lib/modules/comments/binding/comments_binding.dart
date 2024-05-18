import 'package:get/get.dart';
import 'package:hacker_news_app/modules/comments/comments.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> CommentsRepository(apiClient: Get.find()));
    Get.lazyPut(()=> CommentsController(commentsRepo: Get.find()));
  }

}