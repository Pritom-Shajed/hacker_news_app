import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/models/models.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeController extends GetxController {
 final HomeRepository _homeRepo;

 HomeController({required HomeRepository homeRepo}) : _homeRepo = homeRepo;

 ///User Tour
 late TutorialCoachMark _tutorialCoachMark;

 void initAddInAppTour ({required GlobalKey drawerKey, required GlobalKey newsKey, required GlobalKey commentsKey, VoidCallback? onFinish}){
  _tutorialCoachMark = TutorialCoachMark(
   targets: addAppTargetsPage(
       drawerKey: drawerKey, newsKey: newsKey, commentsKey: commentsKey),
   colorShadow: AppColors.baseColor,
   paddingFocus: 0,
   hideSkip: false,
   opacityShadow: 0.9,
   onFinish: onFinish
  );
 }

 void showInAppTour (BuildContext context){
  _tutorialCoachMark.show(context: context);
 }

 ///SLIDER

 final _topNewsTapped = true.obs;

 set topNewsTapped (value) => _topNewsTapped.value = value;

 bool get topNewsTapped => _topNewsTapped.value;

 final _latestNewsTapped = false.obs;

 set latestNewsTapped (value) => _latestNewsTapped.value = value;

 bool get latestNewsTapped => _latestNewsTapped.value;

 sliderBtnTap({required bool isTopNewsTapped}) {
  if(isTopNewsTapped){
   topNewsTapped = true;
   latestNewsTapped = false;
  } else {
   topNewsTapped = false;
   latestNewsTapped = true;
  }

 }


 ///Initial Loading

 final _isLoadingLatestNews = false.obs;

 set isLoadingLatestNews (value) => _isLoadingLatestNews.value = value;

 bool get isLoadingLatestNews => _isLoadingLatestNews.value;

 final _isLoadingTopNews = false.obs;

 set isLoadingTopNews (value) => _isLoadingTopNews.value = value;

 bool get isLoadingTopNews => _isLoadingTopNews.value;

 ///Pagination Loading

 final _isLoadingPaginationTopNews = false.obs;

 set isLoadingPaginationTopNews (value) => _isLoadingPaginationTopNews.value = value;

 bool get isLoadingPaginationTopNews => _isLoadingPaginationTopNews.value;

 final _isLoadingPaginationLatestNews = false.obs;

 set isLoadingPaginationLatestNews (value) => _isLoadingPaginationLatestNews.value = value;

 bool get isLoadingPaginationLatestNews => _isLoadingPaginationLatestNews.value;

 ///API Calling

 Future<void> fetchNews({required bool isTopNews, bool isLoadingInitial = true, bool isLoadingPagination = false}) async {


  var news = isTopNews ? topNews : latestNews;

  var newsIds = isTopNews ? topNewsIds : latestNewsIds;

  if(isLoadingInitial){
   if(news.isEmpty){
    isTopNews ? isLoadingTopNews = true : isLoadingLatestNews = true;
    if(newsIds.length <= 8){
     for(var i = 0; i < newsIds.length; i++){
      await _fetchSpecificNewsById(newsIds[i], isTopNews: isTopNews);
     }
    } else {
     for(var i = 0; i <= 8; i++){
      await _fetchSpecificNewsById(newsIds[i], isTopNews:  isTopNews);
     }
    }
   }
   isTopNews ? isLoadingTopNews = false : isLoadingLatestNews = false;
  }

  if(isLoadingPagination){

   if(news.length < newsIds.length){

    isTopNews ? isLoadingPaginationTopNews = true : isLoadingPaginationLatestNews = true;

    if((newsIds.length - news.length) < 8 && (newsIds.length - news.length) > 0){
     for(var i = news.length; i < newsIds.length; i++){
      await _fetchSpecificNewsById(newsIds[i], isTopNews: false);
     }
    } else {
     final currentNewsLength = news.length;
     for(var i = currentNewsLength; i <= currentNewsLength + 8; i++){
      await _fetchSpecificNewsById(newsIds[i], isTopNews:  isTopNews);
     }
    }
   }
   isTopNews ? isLoadingPaginationTopNews = false : isLoadingPaginationLatestNews = false;

  }

 }



 ///TOP NEWS
 final RxList<int> topNewsIds = <int>[].obs;

 Future<ResponseModel> fetchTopNewsIds() async {
  topNewsIds.clear();
  try {
   final response = await _homeRepo.fetchTopNews();

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

   final response = await _homeRepo.fetchLatestNews();

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

 Future<ResponseModel> _fetchSpecificNewsById(int id, {required bool isTopNews}) async {
  try {

   final response = await _homeRepo.fetchSpecificNews(id);

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