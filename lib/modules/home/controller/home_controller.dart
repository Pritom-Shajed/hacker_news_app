import 'dart:developer';

import 'package:get/get.dart';
import 'package:hacker_news_app/data/api/api_response_handler.dart';
import 'package:hacker_news_app/models/models.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomeController extends GetxController {
 final HomeRepository homeRepo;

 HomeController({required this.homeRepo});


 ///NEWS DESCRIPTION


 final _isLoadingLatestNews = false.obs;

 set isLoadingLatestNews (value) => _isLoadingLatestNews.value = value;

 bool get isLoadingLatestNews => _isLoadingLatestNews.value;

 final _isLoadingTopNews = false.obs;

 set isLoadingTopNews (value) => _isLoadingTopNews.value = value;

 bool get isLoadingTopNews => _isLoadingTopNews.value;

 Future<void> fetchNews({required bool isTopNews}) async {

  isTopNews ? isLoadingTopNews = true : isLoadingLatestNews = true;

 if(isTopNews ? topNews.isEmpty : latestNews.isEmpty){
  if((isTopNews ? topNewsIds.length : latestNewsIds.length) <= 15){
   for(var i = 0; i <= (isTopNews ? topNews.length : latestNewsIds.length); i++){
    await fetchSpecificNewsById(isTopNews ? topNewsIds[i] : latestNewsIds[i], isTopNews: isTopNews);
   }
  } else {
   for(var i = 0; i <= 15; i++){
    await fetchSpecificNewsById(isTopNews ? topNewsIds[i] : latestNewsIds[i], isTopNews:  isTopNews);
   }
  }
 }
  isTopNews ? isLoadingTopNews = false : isLoadingLatestNews = false;

 }

 ///TOP NEWS
 final RxList<int> topNewsIds = <int>[].obs;

 Future<ResponseModel> fetchTopNewsIds() async {
  topNewsIds.clear();
  try {
   final response = await homeRepo.fetchTopNews();

   final apiResponseHandler = ApiResponseHandler(
    response, successCallback: (response) {

    final List topNews = response.body;

    topNews.forEach((news) => topNewsIds.add(news));

    return ResponseModel(true, Strings.success);
   },
   );
   return apiResponseHandler.handleResponse();
  } catch (e) {
   throw Exception(e.toString());
  }

 }

 ///LATEST NEWS
 final RxList<int> latestNewsIds = <int>[].obs;

 Future<ResponseModel> fetchLatestNewsIds() async {
  latestNewsIds.clear();
  try {

   final response = await homeRepo.fetchLatestNews();

   final apiResponseHandler = ApiResponseHandler(
    response, successCallback: (response) {
    final List latestNews = response.body;

    latestNews.forEach((news) => latestNewsIds.add(news));

    return ResponseModel(true, Strings.success);
    },
   );
   return apiResponseHandler.handleResponse();
  } catch (e) {
   throw Exception(e.toString());
  }
 }

 final RxList<NewsModel> latestNews = <NewsModel>[].obs;
 final RxList<NewsModel> topNews = <NewsModel>[].obs;

 Future<ResponseModel> fetchSpecificNewsById(int id, {required bool isTopNews}) async {
  try {

   final response = await homeRepo.fetchSpecificNews(id);

   final apiResponseHandler = ApiResponseHandler(
    response, successCallback: (response) {
    var news = response.body;

    if(isTopNews){
     topNews.add(NewsModel.fromJson(news));
    } else {
     latestNews.add(NewsModel.fromJson(news));
    }

    return ResponseModel(true, Strings.success);
   },
   );
   return apiResponseHandler.handleResponse();
  } catch (e) {
   throw Exception(e.toString());
  }
 }
}