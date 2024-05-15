import 'package:flutter/material.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLoaders.spinningLines()
          ],
        ),
      ),
    );
  }
}