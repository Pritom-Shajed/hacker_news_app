import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {

  static String get fileName {
    if(kReleaseMode){
      return '.env.production';
    } else {
      return '.env.development';
    }
  }
  static String get baseApiUrl {
    return dotenv.env['BASEURL'] ?? 'API URL NOT FOUND';
  }


}