import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomeRepository {
  final ApiClient apiClient;
  HomeRepository({required this.apiClient});

  Future<Response> fetchTopStories () async{
    return await apiClient.getData(ApiEndpoints.topNews);
  }

  Future<Response> fetchNewStories () async{
    return await apiClient.getData(ApiEndpoints.latestNews);
  }

}