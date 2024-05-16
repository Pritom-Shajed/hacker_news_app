import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/buttons/app_buttons.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/modules/home/widgets/home_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late TabController _tabController;

  final _controller = Get.find<HomeController>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _controller.fetchNews(isTopNews: true);
    _controller.fetchNews(isTopNews: false);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topNews = _controller.topNews;
    final latestNews = _controller.latestNews;

    return Scaffold(
      appBar: GlobalAppBar.common(text: Strings.appName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        HomeWidgets.tabBar(controller: _tabController,tabText1: Strings.topNews, tabText2: Strings.latestNews),

          Expanded(child: TabBarView(
              controller: _tabController,
              children: [
                Obx(() => _newsPage(isLoading: _controller.isLoadingTopNews, news: topNews)),
                Obx(()=>  _newsPage(isLoading: _controller.isLoadingLatestNews, news: latestNews)
                ),
              ],))
        ],
      ),
    );
  }
}

Widget _newsPage ({required bool isLoading, required List<NewsModel> news}){
  return   isLoading ? const Center(child: CircularProgressIndicator()) : Padding(
      padding: REdgeInsets.all(12),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: news.length,
          separatorBuilder: (context, index) => 14.verticalSpace,
          itemBuilder: (context, index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButtons.textButton(
                    onTap: () async{
                      if(news[index].url != null){
                        final url = Uri.parse(news[index].url!);
                        AppUrlLauncher.launchNewsUrl(url);
                      }

                    },
                    text: news[index].title ?? ''),
                AppTexts.verySmallText(text: '${news[index].score} points by ${news[index].by} | ${TimeFormatter.differenceInHours(timestamp: news[index].time!)} hours ago | ${news[index].kids?.length ?? 0} comments')                     ],
            );
          })
  );
}
