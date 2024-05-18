import 'package:get/get.dart';
import 'package:hacker_news_app/storage/repository/storage_repository.dart';

class StorageController extends GetxController {
  final StorageRepository _storageRepo;

  StorageController({required StorageRepository storageRepo}) : _storageRepo = storageRepo;


  Future<void> saveIsUserTourAvailable ({required bool isUserTourAvailable}) async{
    await _storageRepo.saveIsUserTourAvailable(isUserTourAvailable: isUserTourAvailable);
  }


  bool getIsUserTourAvailable () {
    return  _storageRepo.getIsUserTourAvailable();
  }

  void clearData ()  {
    _storageRepo.clearData();
  }
}