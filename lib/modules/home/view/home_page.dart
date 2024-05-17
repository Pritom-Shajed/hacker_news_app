import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/modules/home/widgets/home_widgets.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{


  final _controller = Get.find<HomeController>();

  late ScrollController _topNewsScrollController;
  late ScrollController _latestNewsScrollController;

  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    _controller.fetchNews(isTopNews: true);
    _topNewsScrollController = ScrollController();
    _latestNewsScrollController = ScrollController();
    _topNewsScrollController.addListener(() {
      if (_topNewsScrollController.position.pixels >= _topNewsScrollController.position.maxScrollExtent && !_controller.isLoadingPaginationTopNews) {
          _controller.fetchNews(isTopNews: true, isLoadingInitial: false, isLoadingPagination: true);
      }
    });
    _latestNewsScrollController.addListener(() {
      if (_latestNewsScrollController.position.pixels >= _latestNewsScrollController.position.maxScrollExtent) {
        _controller.fetchNews(isTopNews: false,isLoadingInitial: false, isLoadingPagination: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _topNewsScrollController.dispose();
    _latestNewsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topNews = _controller.topNews;
    final latestNews = _controller.latestNews;

    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: GlobalAppBar.common(),
        slider: HomeWidgets.slider(key: _key),
        child: Padding(
          padding: REdgeInsets.only(left: 12, right: 12, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              HomeWidgets.greetings(appName: Strings.appName),

              Expanded(
                  child: Obx(() => _newsPage(
                    controller: _controller,
                      scrollController: _controller.topNewsTapped ? _topNewsScrollController : _latestNewsScrollController,
                      news: _controller.topNewsTapped ? topNews : latestNews)))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _newsPage ({required HomeController controller, required List<NewsModel> news, required ScrollController scrollController}){

  return Obx(() {
    final isLoadingInitial = controller.topNewsTapped ? controller.isLoadingTopNews : controller.isLoadingLatestNews;
    final isLoadingPagination = controller.topNewsTapped ? controller.isLoadingPaginationTopNews : controller.isLoadingPaginationLatestNews;
   return  ListView.separated(
        controller: scrollController,
        physics: isLoadingInitial ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
        itemCount: isLoadingInitial ? 5 : news.length + 1,
        separatorBuilder: (context, index) => 14.verticalSpace,
        itemBuilder: (context, index){
          if(isLoadingInitial) {
            return HomeWidgets.newsTileSkeleton();
          } else {
            if(index < news.length){
              return HomeWidgets.newsTile(news[index], isTopNews: controller.topNewsTapped, onTapNews: () {}, onTapComments: () {});
            } else {
              return isLoadingPagination ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink();
            }
          }

        });
  });
}
