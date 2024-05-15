import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/data/api/api_response_handler.dart';
import 'package:hacker_news_app/models/models.dart';
import 'package:hacker_news_app/modules/home/repository/home_repository.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomeController extends GetxController {
 final HomeRepository homeRepo;

 HomeController({required this.homeRepo});


 ///TOP NEWS
 final RxList<int> topNewsIds = <int>[].obs;

 Future<ResponseModel> fetchTopNews() async {
  topNewsIds.clear();
  try {
   final response = await homeRepo.fetchTopStories();

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

 Future<ResponseModel> fetchLatestNews() async {
  latestNewsIds.clear();
  try {

   final response = await homeRepo.fetchNewStories();

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

}