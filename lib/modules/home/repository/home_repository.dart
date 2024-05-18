import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomeRepository {
  final ApiClient _apiClient;
  HomeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Response> fetchTopNews () async{
    return await _apiClient.getData(ApiEndpoints.topNews);
  }

  Future<Response> fetchLatestNews () async{
    return await _apiClient.getData(ApiEndpoints.latestNews);
  }

  Future<Response> fetchSpecificNews (int id) async{
    return await _apiClient.getData(ApiEndpoints.specificItem(id));
  }

}