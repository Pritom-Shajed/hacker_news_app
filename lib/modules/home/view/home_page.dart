import 'package:flutter/material.dart';
import 'package:hacker_news_app/components/global_widgets/global_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppTexts.mediumText(text: 'Home'),),
    );
  }
}
