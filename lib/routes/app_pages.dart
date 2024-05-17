import 'package:get/get.dart';
import 'package:hacker_news_app/modules/home/home.dart';
import 'package:hacker_news_app/modules/news_details/news_details.dart';
import 'package:hacker_news_app/modules/splash/splash.dart';
part 'app_routes.dart';

abstract class AppPages {

  static String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () =>  const HomePage(),
    ),

    GetPage(
      name: Routes.DETAILS,
      page: () =>  const NewsDetailsPage(),
      binding: NewsDetailsBinding()
    ),
  ];
}