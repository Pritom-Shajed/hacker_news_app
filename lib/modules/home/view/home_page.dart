import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/modules/home/widgets/home_widgets.dart';
import 'package:hacker_news_app/routes/app_pages.dart';
import 'package:hacker_news_app/storage/storage.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  final _homeController = Get.find<HomeController>();

  final _storageController = Get.find<StorageController>();

  late ScrollController _topNewsScrollController;
  late ScrollController _latestNewsScrollController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _drawerKey = GlobalKey();
  final _newsKey = GlobalKey();
  final _commentsKey = GlobalKey();

  @override
  void initState() {
    _homeController.fetchNews(isTopNews: true).whenComplete((){
      if(_storageController.getIsUserTourAvailable()){
        _homeController.initAddInAppTour(drawerKey: _drawerKey, newsKey: _newsKey, commentsKey: _commentsKey, onFinish: (){
          _storageController.saveIsUserTourAvailable(isUserTourAvailable: true);
        });
        _homeController.showInAppTour(context);
      }

    });
    _topNewsScrollController = ScrollController();
    _latestNewsScrollController = ScrollController();
    _topNewsScrollController.addListener(() {
      if (_topNewsScrollController.position.pixels >= _topNewsScrollController.position.maxScrollExtent && !_homeController.isLoadingAddTopNews)  {
        _homeController.fetchNews(isTopNews: true, isLoadingInitial: false, isLoadingPagination: true);
      }
    });
    _latestNewsScrollController.addListener(() {
      if (_latestNewsScrollController.position.pixels >= _latestNewsScrollController.position.maxScrollExtent && !_homeController.isLoadingAddLatestNews) {
        _homeController.fetchNews(isTopNews: false,isLoadingInitial: false, isLoadingPagination: true);
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


    return Scaffold(
    key: _scaffoldKey,
      appBar: HomeWidgets.appBar(
          drawerKey: _drawerKey,
          onTapDrawer: (){
        _scaffoldKey.currentState!.openDrawer();
      }),
      drawer: HomeWidgets.slider(key: _scaffoldKey),
      body: GetBuilder<HomeController>(builder: (controller){
        final topNews = controller.topNews;
        final latestNews = controller.latestNews;
        return Padding(
          padding: REdgeInsets.only(left: 12, right: 12, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
              HomeWidgets.greetings(appName: Strings.appName),

              8.verticalSpace,
      
              Expanded(
                  child: Obx(() => _newsPage(
                      newsKey: _newsKey,
                      commentsKey: _commentsKey,
                      controller: controller,
                      scrollController: controller.topNewsTapped ? _topNewsScrollController : _latestNewsScrollController,
                      news: controller.topNewsTapped ? topNews : latestNews)))
            ],
          ),
        );
      },),
    );
  }
}

Widget _newsPage ({Key? newsKey, Key? commentsKey, required HomeController controller, required List<NewsModel> news, required ScrollController scrollController}){

  return Obx(() {
    final isLoadingInitial = controller.topNewsTapped ? controller.isLoadingTopNews : controller.isLoadingLatestNews;
    final isLoadingPagination = controller.topNewsTapped ? controller.isLoadingAddTopNews : controller.isLoadingAddLatestNews;
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
              final newsDetail = news[index];
              return HomeWidgets.newsTile(newsKey: index == 0 ? newsKey : null, commentsKey: index == 0 ? commentsKey : null, newsDetail, isTopNews: controller.topNewsTapped, onTapNews: () {
                if(newsDetail.url != null && newsDetail.url!.isNotEmpty){
                  Get.toNamed(Routes.DETAILS, arguments: newsDetail);
                } else {
                  AppToasts.shortToast(Strings.noDetailsAvailable);
                }
              }, onTapComments: () {
                if(newsDetail.kids != null && newsDetail.kids!.isNotEmpty){
                  Get.toNamed(Routes.COMMENTS, arguments: newsDetail);
                } else {
                  AppToasts.shortToast(Strings.noCommentsAvailable);
                }
              });

            } else {
              return isLoadingPagination ? HomeWidgets.newsTileSkeleton() : const SizedBox.shrink();
            }
          }

        });
  });
}
