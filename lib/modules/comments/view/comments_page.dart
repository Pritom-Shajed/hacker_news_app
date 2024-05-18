import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/app_bar/global_app_bar.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/comments/comments.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/modules/home/widgets/home_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  final _controller = Get.find<CommentsController>();

  final NewsModel _news = Get.arguments;

  late ScrollController _scrollController;

  @override
  void initState() {
    _controller.fetchComments(commentIds: _news.kids!);
    _scrollController = ScrollController();
    _scrollController.addListener((){
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !_controller.isLoadingAddComments)  {
        _controller.fetchComments( isLoadingInitial: false, isLoadingPagination: true, commentIds: _news.kids!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar.common(text: Strings.comments),
      body: Padding(
        padding: REdgeInsets.all(4),
        child: Column(
          children: [

            NewsGlobalWidgets.newsHeader(title: _news.title, score: _news.score, author: _news.by, time: _news.time),

            12.verticalSpace,

            Expanded(
              child: Obx(() {
                return ListView.separated(
                  controller: _scrollController,
                    physics: _controller.isLoadingComments ?  const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
                    itemCount: _controller.isLoadingComments ?  5 : _controller.comments.length +1,
                    separatorBuilder: (context, index) => 8.verticalSpace,
                    itemBuilder: (context, index) {

                      if(_controller.isLoadingComments){
                        return HomeWidgets.newsTileSkeleton();
                      } else {

                        if(index < _controller.comments.length){
                          final comment = _controller.comments[index];
                          return CommentsWidgets.commentTile(time: comment.time ?? 0, author: comment.by ?? '', comment: comment.text ?? '');
                        } else {
                          return _controller.isLoadingAddComments ? HomeWidgets.newsTileSkeleton() : const SizedBox.shrink();
                        }

                      }

                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
