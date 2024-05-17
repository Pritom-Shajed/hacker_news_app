import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:hacker_news_app/helper/helper.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'routes/routes.dart';
import 'utils/constants/constants.dart';
import 'utils/styles/styles.dart';

void main() {
  Initializer.init(() async {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 758),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => GlobalLoaderOverlay(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            defaultTransition: Transition.cupertino,
            theme: ThemeConfig.darkTheme,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        ));
  }
}