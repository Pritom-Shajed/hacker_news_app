import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';
import 'package:hacker_news_app/modules/home/controller/home_controller.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar.common(text: Strings.appName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        HomeWidgets.tabBar(controller: _tabController,tabText1: Strings.latestNews, tabText2: Strings.topNews),

          Expanded(child: TabBarView(
              controller: _tabController,
              children: [
                AppTexts.smallText(text: 'Latest News: ${_controller.latestNewsIds.length}'),
                AppTexts.smallText(text: 'Top News: ${_controller.topNewsIds.length}'),
              ],))
        ],
      ),
    );
  }
}
