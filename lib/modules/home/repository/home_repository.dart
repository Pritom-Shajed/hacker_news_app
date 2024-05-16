import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomeRepository {
  final ApiClient apiClient;
  HomeRepository({required this.apiClient});

  Future<Response> fetchTopNews () async{
    return await apiClient.getData(ApiEndpoints.topNews);
  }

  Future<Response> fetchLatestNews () async{
    return await apiClient.getData(ApiEndpoints.latestNews);
  }

  Future<Response> fetchSpecificNews (int id) async{
    return await apiClient.getData(ApiEndpoints.specificNews(id));
  }

}