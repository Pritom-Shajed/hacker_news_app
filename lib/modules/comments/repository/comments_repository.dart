import 'package:get/get.dart';
import 'package:hacker_news_app/data/api/api_client.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class CommentsRepository {
  final ApiClient apiClient;

  CommentsRepository({required this.apiClient});

  Future<Response> fetchSpecificComment (int id) async{
    return await apiClient.getData(ApiEndpoints.specificItem(id));
  }
}