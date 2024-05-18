import 'package:get/get.dart';
import 'package:hacker_news_app/data/data.dart';
import 'package:hacker_news_app/models/models.dart';
import 'package:hacker_news_app/modules/comments/comments.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class CommentsController extends GetxController {
  final CommentsRepository commentsRepo;

  CommentsController({required this.commentsRepo});


  final _isLoadingComments = false.obs;

  set isLoadingComments (value) => _isLoadingComments.value = value;

  bool get isLoadingComments => _isLoadingComments.value;

  final _isLoadingAddComments = false.obs;

  set isLoadingAddComments (value) => _isLoadingAddComments.value = value;

  bool get isLoadingAddComments => _isLoadingAddComments.value;


  Future<void> fetchComments({required List<dynamic> commentIds, bool isLoadingInitial = true, bool isLoadingPagination = false}) async {

    try {
      if(isLoadingInitial){
        comments.clear();
        if(comments.isEmpty){
          isLoadingComments = true;
          if(commentIds.length <= 8){
            for(var i = 0; i < commentIds.length; i++){
              await _fetchSpecificNewsById(commentIds[i]);
            }
          } else {
            for(var i = 0; i <= 8; i++){
              await _fetchSpecificNewsById(commentIds[i]);
            }
          }
        }
        isLoadingComments = false;
      }
    } catch (e){
      throw Exception(e.toString());
    }


    if(isLoadingPagination){

      if(comments.length < commentIds.length){

        isLoadingAddComments = true;

        if((commentIds.length - comments.length) < 8 && (commentIds.length - comments.length) > 0){
          for(var i = comments.length; i < commentIds.length; i++){
            await _fetchSpecificNewsById(commentIds[i]);
          }
        } else {
          final currentNewsLength = comments.length;
          for(var i = currentNewsLength; i <= currentNewsLength + 8; i++){
            await _fetchSpecificNewsById(commentIds[i]);
          }
        }
      }
      isLoadingAddComments = false;

    }

  }

  final RxList<CommentsModel> comments = <CommentsModel>[].obs;

  Future<ResponseModel> _fetchSpecificNewsById(int id) async {
    try {

      final response = await commentsRepo.fetchSpecificComment(id);


      final apiResponseHandler = ApiResponseHandler(
        response, successCallback: (response) {
        var news = response.body;

        comments.add(CommentsModel.fromJson(news));

        return ResponseModel(true, Strings.success);
      },
      );
      return apiResponseHandler.handleResponse();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}