import 'package:hacker_news_app/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  final SharedPreferences _sharedPreferences;

  StorageRepository({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;



  Future<void> saveIsUserTourAvailable ({required bool isUserTourAvailable}) async {
    await _sharedPreferences.setBool(StorageConstants.IS_FIRST_TIME_USER, false);
  }

  bool getIsUserTourAvailable ()  {
    return _sharedPreferences.getBool(StorageConstants.IS_FIRST_TIME_USER) ?? true;
  }

  bool clearData() {
    _sharedPreferences.clear();
    return true;
  }
}