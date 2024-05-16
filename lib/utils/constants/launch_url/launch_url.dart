import 'package:url_launcher/url_launcher.dart';

class AppUrlLauncher {
  AppUrlLauncher._();

  static Future launchNewsUrl (Uri url) async{
    if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
    }
  }
}